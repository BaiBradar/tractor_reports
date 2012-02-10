class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def check_user
    redirect_to(signin_path) unless signed_in?
  end
end
