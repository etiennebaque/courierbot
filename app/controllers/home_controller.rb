class HomeController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user ||= User.new
  end

  def about
  end
end
