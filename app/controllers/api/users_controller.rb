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
      @user = User.new(user_params)
      @user.save!

      sign_in :user, @user
      render json: :ok
    rescue StandardError => e
      render json: @user.errors.to_hash(true), status: :unprocessable_entity
    end

    private

    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
  end
end
