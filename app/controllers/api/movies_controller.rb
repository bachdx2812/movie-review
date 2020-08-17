module Api
  class MoviesController < BaseController
    before_action :authenticate_user_json!, only: [:like, :dislike]

    def search
      collection = Movie.all.order(id: :desc)

      pagy, movies = pagy(
        collection,
        items: params[:perPage] || PER_PAGE,
        page: params[:page],
      )

      return response_collection_success(
        movies,
        pagy,
        each_serializer: ::Home::HomeMoviesSerializer,
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
      end

      response_success(message: "ok")
    rescue AlreadyRatedError, StandardError => e
      response_error(
        e.message,
        status: :unprocessable_entity,
      )
    end
  end
end
