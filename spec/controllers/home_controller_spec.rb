require "rails_helper"
RSpec.describe HomeController do
  describe "GET #index" do
    subject { get :index }

    it "returns a 200 OK status" do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it "renders the index template" do
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("home/index")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("home/show")
      expect(subject).to_not render_template("home/edit")
      expect(subject).to_not render_template("home/create")
    end
  end
end
