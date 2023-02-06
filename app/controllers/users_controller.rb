class UsersController < ApplicationController
  before_action :authorize, except: %i[new create]
  load_and_authorize_resource

  def index
  end

  def new
  end

  def show
    User.accessible_by(current_ability)
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
