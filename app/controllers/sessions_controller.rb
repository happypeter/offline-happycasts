class SessionsController < ApplicationController
  def login
  end

  def create
    @user = User.authenticate(params[:name_or_email], params[:password])

    if @user
      cookies.permanent[:token] = @user.token
      redirect_to @user, notice: "Welcome back"
    else
      redirect_to login_path, notice: "Error name or password"
    end
  end

  def destroy
    cookies.delete(:token)
    redirect_to root_url, :notice => "You have been logged out."
  end
end
