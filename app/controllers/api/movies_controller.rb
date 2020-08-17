module Api
  class MoviesController < BaseController
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
      authenticate_user_json!
    rescue UnauthorizedError => e
      response_error(
        e,
        status: 403,
        code: "403",
      )
    end

    def dislike
      authenticate_user_json!
    rescue UnauthorizedError => e
      response_error(
        e,
        status: 403,
        code: "403",
      )
    end
  end
end
