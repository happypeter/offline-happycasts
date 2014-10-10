class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by_token(cookies[:token]) if cookies[:token]
  end

  helper_method :current_user

  def check_login
    #FIXME: I don't think this is perfect
    if current_user.blank?
      redirect_to login_path, :notice => "Login first place"
    end
  end

  def redirect_to_target_or_default(default, *options)
    redirect_to(session[:return_to] || default, *options)
    session[:return_to] = nil
  end
end
