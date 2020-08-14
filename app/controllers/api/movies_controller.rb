module Api
  class MoviesController < BaseController
    def search
      collection = Movie.all.order(id: :desc)

      pagy, articles = pagy(
        collection,
        items: params[:perPage] || PER_PAGE,
        page: params[:page],
      )

      return response_collection_success(
        articles,
        pagy,
        each_serializer: ::Home::HomeMoviesSerializer,
      )
    rescue Pagy::OverflowError => e
      Rails.logger.error("#{self.class.name} error #{action_name} fetch #{e.backtrace.join('\n')}")
      return render json: { movies: [] }
    end
  end
end
