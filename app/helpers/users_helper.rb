module UsersHelper

  def current_user
    @current_user ||= User.find_by_token(cookies[:token]) if cookies[:token]
  end

  def current_user?(user)
    user == current_user
  end

  def logined_user?
    !current_user.nil?
  end

  def store_forward_page
    session[:forward_to] = request.url
  end

  def redirect_to_forward(default)
    redirect_to(session[:forward_to] || default )
    session.delete(:forward_to)
  end

  def have_logined_user
    unless logined_user?
      store_forward_page
      redirect_to login_path, notice: 'Please login!'
    end
  end

end
