class UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def destroy
  end
end
