class TractorDriversController < ApplicationController
  before_filter :check_user
  
  def add_tractor_driver
    @title = "Add Tractor Driver"
    @tractor_driver = current_user.tractor_drivers.build
  end
  
  def create
    @tractor_driver = current_user.tractor_drivers.build(params[:tractor_driver])
    
    if @tractor_driver.save
      flash[:success] = "Added new driver"
      redirect_to add_tractor_driver_path
    else
      render :add_tractor_driver
    end
  end
  
  def remove_tractor_driver
  end
end
