class Api::V1::UsersController < Api::ApiController

  before_action :find_user, only: [:show, :update, :destroy]

  def index
    render json: User.all
  end

  def show
    render json: @user, status: 401
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
    if @user.update(user_params)
      render json: @user, status: 200, locaiton: [:api, @user]
    else
      render json: { errors: @user.errors }, status: 202
    end
  end

  def destroy
    @user.destroy
    head 204
  end

  protected
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find_by(id: params[:id])
      if @user.nil?
        render json: { errors: 'user not found' }, status: 404
      end
    end

end
