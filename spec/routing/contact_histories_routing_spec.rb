require "rails_helper"

RSpec.describe ContactHistoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/contact_histories").to route_to("contact_histories#index")
    end

    it "routes to #show" do
      expect(get: "/contact_histories/1").to route_to("contact_histories#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/contact_histories").to route_to("contact_histories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/contact_histories/1").to route_to("contact_histories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/contact_histories/1").to route_to("contact_histories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/contact_histories/1").to route_to("contact_histories#destroy", id: "1")
    end
  end
end
