class Api::V1::UsersController < Api::ApiController

  before_action :authenticate_with_token!, only: [:index, :show, :update, :destroy]

  def index
    render json: User.all
  end

  def show
    render json: current_user, status: 401
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 202
    end
  end

  def update
    if current_user.update(user_params)
      render json: current_user, status: 200, locaiton: [:api, current_user]
    else
      render json: { errors: current_user.errors }, status: 202
    end
  end

  def destroy
    current_user.destroy
    head 204
  end

  protected
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
