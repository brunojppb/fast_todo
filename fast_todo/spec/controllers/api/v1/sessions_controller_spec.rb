require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create :user
    @device = FactoryGirl.create :device, user: @user
    request.headers['Accept'] = "application/vnd.fasttodo.v1"
    request.headers['Authorization'] = @device.auth_token
  end

  describe "when POST #create" do
    context "when user successfully log in" do
      before(:each) do
        post :create, { session: { email: @user.email, password: "123456", operation_system: "Android"} }, format: :json
      end

      it "should return a new device associated with the logged in user" do
        session_response = JSON.parse(response.body, symbolize_names: true)
        expect(session_response[:user_id]).to eql @user.id
      end
    end

    context "when user unsuccessfully log in" do
      before(:each) do
        post :create, { session: { email: @user.email, password: "1234567", operation_system: "Google Chrome"} }, format: :json
      end

      it "should return an error message" do
        session_response = JSON.parse(response.body, symbolize_names: true)
        expect(session_response[:errors]).to include "wrong email/password combination"
      end
    end

  end

  describe "when DELETE #destroy" do
    context "when user successfully log out" do
      before(:each) do
        delete :destroy, id: @device.auth_token, format: :json
      end

      it { should respond_with 204 }
    end
  end

end
