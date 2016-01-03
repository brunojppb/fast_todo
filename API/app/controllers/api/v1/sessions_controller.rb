class Api::V1::SessionsController < Api::ApiController

  def create
    email = params[:session][:email]
    password = params[:session][:password]
    if !email.nil? && !password.nil?
      user = User.find_by(email: email)
      if user && user.authenticate(password)
        device = create_device(user, params[:session][:operation_system])
        render json: device, status: 201
      else
        render json: { errors: "wrong email/password combination" }, status: 202
      end
    end
  end

  def destroy
    device = Device.find_by(auth_token: params[:id])
    if !device.nil? && device.destroy
      head 204
    else
      render json: { errors: "user not authenticated" }, status: 403
    end
  end

  private
    def create_device(user, os)
      user.devices.create(operation_system: os, active: true)
    end

end
