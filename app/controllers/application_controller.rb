class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include FuelLoadsHelper
  include ReportsHelper
  require "bigdecimal"
  require "bigdecimal/util"
  
  def check_user
    redirect_to(signin_path) unless signed_in?
  end
  
  def correct_fuel(tractor_code, amount)
    @tractor = current_user.tractors.where("code = ?", tractor_code).first
    amount = @tractor.current_fuel + amount.to_d
    @tractor.update_attribute("current_fuel", amount)
  end
end
