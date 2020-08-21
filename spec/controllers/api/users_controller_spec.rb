require "rails_helper"

RSpec.describe "User" do
  context "login", :type => :request do
    before :each do
      @user = User.create(username: "vutaka", password: "123456")
    end
    it "correct username&password must be success" do
      post "/api/users/login.json", params: { username: @user.username, password: @user.password }

      expect(response).to have_http_status(:success)
    end

    it "incorrect username, correct password return error" do
      post "/api/users/login.json", params: { username: @user.username + "1", password: @user.password + "1" }

      expect(response).to have_http_status(:internal_server_error)
    end

    it "correct username, in correct password return error" do
      post "/api/users/login.json", params: { username: @user.username, password: @user.password + "1" }

      expect(response).to have_http_status(:internal_server_error)
    end

    it "username and password is empty return error" do
      post "/api/users/login.json", params: { username: "", password: "" }

      expect(response).to have_http_status(:internal_server_error)
    end

    it "password is empty return error" do
      post "/api/users/login.json", params: { username: @user.username, password: "" }

      expect(response).to have_http_status(:internal_server_error)
    end

    it "username is empty return error" do
      post "/api/users/login.json", params: { username: "", password: @user.password }

      expect(response).to have_http_status(:internal_server_error)
    end
  end

  context "register", :type => :request do
    it "valid username&password must be success" do
      post "/api/users/register.json", params: { username: "vutaka123", password: "12341234" }

      expect(response).to have_http_status(:success)
    end

    it "prevent empty username&password" do
      post "/api/users/register.json", params: { username: "", password: "" }

      expect(response).to have_http_status(:unprocessable_entity)
    end
    it "prevent empty password" do
      post "/api/users/register.json", params: { username: Faker::Internet.username, password: "" }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "prevent empty username" do
      post "/api/users/register.json", params: { username: "", password: "1234234" }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
