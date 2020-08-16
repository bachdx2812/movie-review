module Api
  class BaseController < ApplicationController
    include Pagy::Backend
    PER_PAGE = ENV["DEFAULT_PER_PAGE"]||10

    def authenticate_user_json!
      raise UnauthorizedError.new("You need to authenticate to perform this action") unless current_user
    rescue UnauthorizedError => e
      response_error(
        e,
        status: 403,
        code: "403",
      )
    end

    def response_collection_success(data, pagy_data, **options)
      response_success(data, **{
                         adapter: :json,
                         meta: {
                           total: pagy_data.count,
                           page: pagy_data.page,
                           from: pagy_data.from,
                           to: pagy_data.to,
                           series: pagy_data.series,
                           pages: pagy_data.pages,
                         },
                         **options,
                       })
    end

    def response_success(data = {}, **options)
      render({
               json: data,
               status: :ok,
               **options,
             })
    end

    def response_error(error = {}, **options)
      render({
               json: error,
               **options,
             })
    end

    def response_not_found
      render json: { message: "not found" }, status: :not_found
    end
  end
end
