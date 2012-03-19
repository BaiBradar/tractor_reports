module FuelLoadsHelper
  def correct_fuel
    current_user.tractors.where("code = ?", params[:fuel_load][:tractor_code]).update_all(:current_fuel => params[:fuel_load][:amount])
  end
end
