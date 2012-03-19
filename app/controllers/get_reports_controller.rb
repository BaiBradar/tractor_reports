class GetReportsController < ApplicationController
  def index
    @title = "| Get reports"
    
    respond_to do |format|
      format.html
    end
  end
  
  def new_salary
    @title = "| Get salary"
    @report = GetReport.new
    
    respond_to do |format|
      format.html # new_salary.html.erb
      redirect_to salary
    end
  end
  
  def salary
    @title = "| Salary"
    
    
  end
end 
