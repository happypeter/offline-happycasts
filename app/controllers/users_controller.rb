class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      cookies.permanent[:token] = user.token
      redirect_to user_path(user)
    else
      render "signup"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def login
    user = User.find_by_name(params[:name])
    if user
      cookies.permanent[:token] = user.token
      redirect_to :root
    else
      flash.alert = "Invalid name or password"
      redirect_to :action => "login_form"
    end
  end

  def login_form
    @user = User.new
  end

end
