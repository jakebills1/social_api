require "rails_helper"
describe Api::V1::PostsController, type: :controller do
  describe "GET index" do
    it "gets an index of posts" do
      get :index, params: {profile_id: 1}
      expect(response).to be_successful
    end
  end
end
