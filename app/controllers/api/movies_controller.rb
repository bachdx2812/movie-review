module Api
  class MoviesController < BaseController
    before_action :authenticate_user_json!, only: [:like, :dislike]

    def search
      collection = Movie.all.includes(:user, :rate_histories).order(id: :desc)

      pagy, movies = pagy(
        collection,
        items: params[:perPage] || PER_PAGE,
        page: params[:page],
      )

      return response_collection_success(
        movies,
        pagy,
        each_serializer: ::Home::HomeMoviesSerializer,
        current_user: current_user,
      )
    rescue Pagy::OverflowError => e
      Rails.logger.error("#{self.class.name} error #{action_name} fetch #{e.backtrace.join('\n')}")
      return render json: { movies: [] }
    end

    def like
      movie = Movie.find(params[:id])
      rate = movie.rate_histories.find_or_initialize_by(
        user_id: current_user.id,
      )

      if rate.persisted? && rate.like?
        raise AlreadyRatedError.new("you have already liked this movie")
      else
        rate.like!
        movie.update_counter!
      end

      return response_success(message: "ok")
    rescue AlreadyRatedError, StandardError => e
      response_error(
        e.message,
        status: :unprocessable_entity,
      )
    end

    def dislike
      movie = Movie.find(params[:id])
      rate = movie.rate_histories.find_or_initialize_by(
        user_id: current_user.id,
      )

      if rate.persisted? && rate.dislike?
        raise AlreadyRatedError.new("you have already disliked this movie")
      else
        rate.dislike!
        movie.update_counter!
      end

      response_success(message: "ok")
    rescue AlreadyRatedError, StandardError => e
      response_error(
        e.message,
        status: :unprocessable_entity,
      )
    end

    def youtube
      result = Youtube::FetchInfoFromYoutube.new(params[:url]).execute
      render json: result.to_json, status: :ok
    rescue FetchVideoYoutubeError => e
      render json: e.message, status: :internal_server_error
    end

    def create
      current_user.movies.create!(movie_params)
    rescue StandardError => e
      render json: e.message, status: :internal_server_error
    end

    private

    def movie_params
      params.permit(
        :title,
        :description,
        :published_at,
        :thumbnail,
        :youtube_video_id,
      )
    end
  end
end
