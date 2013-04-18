class ApplicationController < ActionController::Base
  protect_from_forgery

  include UsersHelper

  # helper_method :current_user # need this to access from the view

end
