require 'rails_helper'

RSpec.describe Api::V1::DevicesController, type: :controller do

  before(:each) { request.headers['Accept'] = "application/vnd.fasttodo.v1" }

  describe "when GET #index" do
    before(:each) do
      @devices = []
      10.times { @devices << FactoryGirl.create(:device) }
      get :index, format: :json
    end

    it "should return 10 devices" do
      device_response = JSON.parse(response.body, symbolize_names: true)
      expect(device_response[:devices].length).to eql 10
    end
  end

  describe "when DELETE #destroy" do
    before(:each) do
      @device = FactoryGirl.create :device
      delete :destroy, id: @device.id, format: :json
    end

    it { should respond_with 204 }
  end

end
