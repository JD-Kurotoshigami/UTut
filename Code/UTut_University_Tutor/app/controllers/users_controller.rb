class UsersController < ApplicationController
  def index
    redirect_to root_url
  end
  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def new
    if logged_in?
      redirect_to root_url
    else
    	@user = User.new
    end
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :firstname, :lastname, :sex, :password, :password_confirmation)
    end
end
