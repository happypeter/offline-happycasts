class UsersController < ApplicationController
  before_filter :access_valid_user, only: [:show, :edit]
  before_filter :have_logined_user, only: [:edit, :update, :show]
  before_filter :current_user_is_proper, only: [:edit, :update]

  def signup
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      cookies.permanent[:token] = user.token
      redirect_to_forward user
      # redirect_to user_path(user)
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
      redirect_to_forward user
      # redirect_to :root
    else
      flash.alert = "Invalid name or password"
      redirect_to :action => "login_form"
    end
  end

  def login_form
    @user = User.new
  end

  def logout
    cookies.delete(:token)
    redirect_to root_url, :notice => "You have been logged out."
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  # avoid <Couldn't find User with id=n> error
  def access_valid_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: 'invalid access!'
    end
  end

  def current_user_is_proper
    redirect_to root_path, notice: 'invalid access!' unless current_user?(@user)
  end

end
