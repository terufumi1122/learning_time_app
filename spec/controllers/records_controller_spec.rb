require 'rails_helper'

RSpec.describe RecordsController, type: :controller do

  describe "http_status" do
    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #create" do
      it "returns http success" do
        get :create
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #update" do
      it "returns http success" do
        get :update
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #line_notify_send" do
      it "returns http success" do
        get :line_notify_send
        expect(response).to have_http_status(:success)
      end
    end
  end
end
