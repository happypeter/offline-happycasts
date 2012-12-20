class UsersController < ApplicationController
  def signup
    @user = User.new
  end
  def create
    user = User.new(params[:user])
    if user.save
      redirect_to :root
    else
      render "signup"
    end
  end
end
