require 'rails_helper'

RSpec.describe "Credits", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/credit/show"
      expect(response).to have_http_status(:success)
    end
  end

end
