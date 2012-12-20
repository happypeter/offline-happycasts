class UsersController < ApplicationController
  def signup
    @user = User.new
  end
  def create
    user = User.new(params[:user])
    if user.save
      redirect_to user_path(user)
    else
      render "signup"
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
