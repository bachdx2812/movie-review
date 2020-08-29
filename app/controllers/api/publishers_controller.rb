module Api
  class PublishersController < BaseController
    def index
      publishers = Publisher.all
      render json: publishers.to_json
    rescue StandardError
      return render json: []
    end
  end
end
