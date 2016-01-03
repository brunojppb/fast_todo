require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create :user
    @device = FactoryGirl.create :device, user: @user
    request.headers['Accept'] = "application/vnd.fasttodo.v1"
    request.headers['Authorization'] = @device.auth_token
  end

  describe "when GET #index" do
    before(:each) do
      @users = []
      10.times { @users << FactoryGirl.create(:user) }
      get :index, format: :json
    end

    it "should return 10 users" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:users].length).to eql 11
    end

    it { should respond_with 200 }
  end

  describe "when GET #show" do
    before(:each) do
      get :show, id: @user.id, format: :json
    end

    it "should return the user information" do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql @user.email
    end
  end

  describe "when POST #create" do
    context "when is successfully created" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }, format: :json
      end

      it "should render the user just created" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql @user_attributes[:email]
      end
      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @user_attributes = { first_name: "hello", last_name: "world", email: "hello@.com" }
        post :create, { user: @user_attributes }, format: :json
      end

      it "should render the user errors" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include "is invalid"
      end
      it { should respond_with 202 }
    end
  end

  describe "when PUT #update" do
    context "When successfully updated" do
      before(:each) do
        @user = FactoryGirl.create :user
        put :update, { id: @user.id, user: { email: "hello@gmail.com" } }, format: :json
      end

      it "should return the updated user" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql "hello@gmail.com"
      end
      it { should respond_with 200 }
    end

    context "When is not updated" do
      before(:each) do
        @user = FactoryGirl.create :user
        put :update, { id: @user.id, user: { email: "hellogmail.com" } }, format: :json
      end

      it "should return the user errors" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include "is invalid"
      end
      it { should respond_with 202 }
    end
  end

  describe "when DELETE #destroy" do
    before(:each) do
      @user = FactoryGirl.create :user
      delete :destroy, id: @user.id
    end

    it { respond_with 204 }
  end

end

















#
