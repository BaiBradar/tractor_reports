class OperationsController < ApplicationController
  require 'bigdecimal'
  require 'bigdecimal/util'

  before_filter :check_user
  
  def add_operation
    @title = "Add Operation"
    @operation = current_user.operations.build()
  end
  
  def create
    params[:operation][:fuel_dk] = params[:operation][:fuel_dk].to_d
    params[:operation][:price_dk] = params[:operation][:price_dk].to_d 
    @operation = current_user.operations.build(params[:operation])
    
    if @operation.save
      flash[:message] = "Added new operation"
      redirect_to add_operation_path
    else 
      redner :add_operation
    end
    
  end
  
  def remove_opration
    
  end
end
