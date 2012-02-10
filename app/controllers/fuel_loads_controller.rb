class FuelLoadsController < ApplicationController
  # GET /fuel_loads
  # GET /fuel_loads.json
  def index
    @fuel_loads = current_user.fuel_loads.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fuel_loads }
    end
  end

  # GET /fuel_loads/1
  # GET /fuel_loads/1.json
  def show
    @fuel_load = FuelLoad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fuel_load }
    end
  end

  # GET /fuel_loads/new
  # GET /fuel_loads/new.json
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

    respond_to do |format|
      if @fuel_load.save
        format.html { redirect_to @fuel_load, notice: 'Fuel load was successfully created.' }
        format.json { render json: @fuel_load, status: :created, location: @fuel_load }
      else
        format.html { render action: "new" }
        format.json { render json: @fuel_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fuel_loads/1
  # PUT /fuel_loads/1.json
  def update
    @fuel_load = current_user.fuel_loads.find(params[:id])

    respond_to do |format|
      if @fuel_load.update_attributes(params[:fuel_load])
        format.html { redirect_to @fuel_load, notice: 'Fuel load was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fuel_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuel_loads/1
  # DELETE /fuel_loads/1.json
  def destroy
    @fuel_load = current_user.fuel_loads.find(params[:id])
    @fuel_load.destroy

    respond_to do |format|
      format.html { redirect_to fuel_loads_url }
      format.json { head :ok }
    end
  end
end
