#encoding: utf-8
class UsersController < ApplicationController
  def welcome
    @issues = Issue.all
  end

  def signup
    @user = User.new
  end

  def login
  end

  def show
    @user = User.find_by_name(params[:username])
    session[:return_to] = request.url
  end

  def create_login_session
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      cookies.permanent[:token] = user.token
      redirect_to root_url
    else
      redirect_to :login
    end
  end

  def logout
    cookies.delete(:token)
    redirect_to root_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies.permanent[:token] = @user.token
      redirect_to :root
    else
      render :signup
    end
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    redirect_to_target_or_default root_url
  end

  private
   def user_params
     params.require(:user).permit!
   end
end
