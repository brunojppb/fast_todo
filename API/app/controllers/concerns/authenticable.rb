module Authenticable

  def current_user
    @device ||= Device.find_by(auth_token: request.headers['Authorization'])
    if @device.nil?
      return nil
    end
    @current_user ||= @device.user
  end

  def authenticate_with_token!
    render json: { errors: "Not Authenticated" }, status: :unauthorized unless user_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

end
