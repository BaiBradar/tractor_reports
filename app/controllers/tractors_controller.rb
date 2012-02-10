class TractorsController < ApplicationController
  require 'bigdecimal'
  require 'bigdecimal/util'
  
  def add_machine
    @title = "Add Machine"
    @tractor = current_user.tractors.build
  end 
  
  def create
    @tractor = current_user.tractors.build(params[:tractor])
    
    if @tractor.save
      flash[:success] = "Added new tractor"
      redirect_to add_machine_path
    else
      render 'add_machine'
    end
    
  end
  
  def remove_machine
  end
end
