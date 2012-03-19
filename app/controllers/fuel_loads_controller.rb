class FuelLoadsController < ApplicationController
  def index
    @title = "| Fuel loads"
    @fuel_loads = current_user.fuel_loads.all
    @drivers = current_user.tractor_drivers.all
  end

 
  # GET all loads of the driver
  def show_for_driver
    @driver = params[:tractor_driver_name]
    @fuel_loads = current_user.fuel_loads.where("tractor_driver_name = ?", params[:tractor_driver_name])
  end
  
  def show_for_tractor
    @tractor_code = params[:tractor_code]
    @fuel_loads = current_user.fuel_loads.where("tractor_code = ?", params[:tractor_code])
  end

  def new
    @fuel_load = current_user.fuel_loads.build
    @tractors = current_user.tractors.all
    @tractor_drivers = current_user.tractor_drivers.all
  end

  # GET /fuel_loads/1/edit
  def edit
    @fuel_load = current_user.fuel_loads.find(params[:id])
    @tractors = current_user.tractors.all 
    @tractor_drivers = current_user.tractor_drivers.all  
  end 

  # POST /fuel_loads 
  # POST /fuel_loads.json 
  def create 
    @fuel_load = current_user.fuel_loads.build(params[:fuel_load]) 
    @tractors = current_user.tractors.all
    @tractor_drivers = current_user.tractor_drivers.all
    
    correct_fuel(params[:fuel_load][:tractor_code], params[:fuel_load][:amount])
 
    respond_to do |format| 
      if @fuel_load.save  
        format.html { redirect_to fuel_loads_path, notice: 'Fuel load was successfully created.' } 
      else 
        format.html { render action: "new" } 
        #format.json { render json: @fuel_load.errors, status: :unprocessable_entity } 
      end 
    end 
  end       
end
