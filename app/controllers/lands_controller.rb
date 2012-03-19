class LandsController < ApplicationController
  before_filter :check_user
  
  def add_land
    @title = "Add Land"
    @land = current_user.lands.build
  end
  
  def create
    @land = current_user.lands.build(params[:land])
    
    if @land.save
      flash[:success] = "Added new land"
      redirect_to add_land_path
    else
      render :add_land
    end
  end
  
  def destroy
  end
end
