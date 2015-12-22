class Api::V1::DevicesController < Api::ApiController

  before_action :find_device, only:[:destroy]
  before_action :authenticate_with_token!, only: [:index, :destroy]

  def index
    devices = current_user.devices
    render json: devices, status: 200
  end

  def destroy
    @device.destroy
    head 204
  end

  private
    def find_device
      @device = Device.find_by(id: params[:id], user_id: current_user.id)
      render json: { errors: "device not found" }, status: 200 if @device.nil?
    end

end
