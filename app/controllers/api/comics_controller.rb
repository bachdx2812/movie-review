module Api
  class ComicsController < BaseController
    def index
      collection = Comic.all.includes(:publisher).order(updated_at: :desc).ransack(params[:q]).result

      pagy, comics = pagy(
        collection,
        items: params[:perPage] || PER_PAGE,
        page: params[:page],
      )

      return response_collection_success(
        comics,
        pagy,
        each_serializer: ::Home::HomeComicsSerializer,
      )
    rescue StandardError => e
      return render json: e.message
    end

    def update
      @comic = Comic.find(params[:id])
      @comic.update!(comic_params)
      render json: :ok
    rescue StandardError => e
      render json: e.message, status: :unprocessable_entity
    end

    def create
      Comic.create!(comic_params)
      render json: :ok
    rescue StandardError => e
      render json: e.message, status: :unprocessable_entity
    end

    def destroy
      @comic = Comic.find(params[:id])
      @comic.destroy!
      render json: :ok
    rescue StandardError => e
      render json: e.message, status: :unprocessable_entity
    end

    private

    def comic_params
      params.permit(
        :title,
        :copyright_title,
        :author,
        :publisher_id,
        :year_start,
        :year_end,
        :volumes_collected,
        :volumes_total,
        :ongoing,
        :finished,
        :thumbnail,
      )
    end
  end
end
