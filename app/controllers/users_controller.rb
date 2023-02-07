class UsersController < ApplicationController
  before_action :authorize, except: %i[new create]
  load_and_authorize_resource

  def index
    # TODO: refatorar
    @users = User.all
    @total = @users.size
    @total_by_role = @users.group(:role).count
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
      session[:user_id] = user.id unless current_user
      redirect_to root_path
    else
      redirect_to '/signup'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = 'The user was successfully destroyed.'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
