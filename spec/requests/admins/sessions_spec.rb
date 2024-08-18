require 'rails_helper'

RSpec.describe "Admins::Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/admins/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end
end
