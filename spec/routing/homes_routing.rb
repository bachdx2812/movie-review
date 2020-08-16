require "rails_helper"

RSpec.describe "routes for Home", :type => :routing do
  it "routes /home to the home controller" do
    expect(get("/")).to route_to("home#index")
  end
end
