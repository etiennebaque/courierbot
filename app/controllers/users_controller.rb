class UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.name} (#{@user.phone_number}) has been registered."
      redirect_to root_path
    else
      render 'home/index'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "#{@user.name}'s profile has been deleted."
    else
      flash[:alert] = "An error ocurred, please try again later."
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone_number)
  end
end
