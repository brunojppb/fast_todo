require 'rails_helper'

RSpec.describe Api::V1::DevicesController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create :user
    @device = FactoryGirl.create :device, user: @user
    request.headers['Accept'] = "application/vnd.fasttodo.v1"
    request.headers['Authorization'] = @device.auth_token
  end

  describe "when GET #index" do
    before(:each) do
      get :index, format: :json
    end

    it "should return 1 device" do
      device_response = JSON.parse(response.body, symbolize_names: true)
      expect(device_response[:devices].length).to eql 1
    end
  end

  describe "when DELETE #destroy" do
    before(:each) do
      delete :destroy, id: @device.id, format: :json
    end

    it { should respond_with 204 }
  end

end
