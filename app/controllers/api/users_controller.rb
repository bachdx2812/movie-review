module Api
  class UsersController < BaseController
    def login
      user = User.find_by(username: params[:username])
      if user && user.valid_password?(params[:password])
        sign_in :user, user
        render json: :ok
      else
        render json: :failed, status: :internal_server_error
      end
    end

    def register
      user = User.create!(user_params)
      sign_in :user, user
      render json: :ok
    rescue StandardError => e
      render json: e.message, status: :internal_server_error
    end

    def logout
      reset_session

      render json: :ok
    end

    private

    def user_params
      params.permit(:username, :password)
    end
  end
end
