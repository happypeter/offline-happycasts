class UsersController < ApplicationController
  def signup
    @user = User.new
  end
end
