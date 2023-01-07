require 'rails_helper'

RSpec.describe "Histories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/histories/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/histories/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/histories/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
