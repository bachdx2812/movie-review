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
      
    end

    def dislike
    end
  end
end
