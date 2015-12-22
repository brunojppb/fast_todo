class Api::V1::DevicesController < Api::ApiController

  before_action :find_device, only:[:destroy]

  def index
    devices = Device.all
    render json: devices, status: 200
  end

  def destroy
    @device.destroy
    head 204
  end

  private
    def find_device
      @device = Device.find_by(id: params[:id])
      render json: { errors: "device not found" } if @device.nil?
    end

end
