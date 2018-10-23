class UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.name} (#{@user.phone_numer}) has been registered."
    else
      flash[:error] = "Please enter a name and a phone number"
    end
    redirect_to root_path
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone_number)
  end
end
