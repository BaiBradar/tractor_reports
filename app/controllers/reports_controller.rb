class ReportsController < ApplicationController
  before_filter :set_assets
  
  # GET /reports
  # GET /reports.json
  def index
    @reports = current_user.reports.all

  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = current_user.reports.find(params[:id])
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = current_user.reports.build
  end

  # GET /reports/1/edit
  def edit
    @report = current_user.reports.find(params[:id])
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = current_user.reports.build(params[:report])#The method salary and apf is private and at the end of file

    correct_fuel(params[:report][:tractor_code], -@report.approximate_fuel_cost)
    
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
       # format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        #format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end 
  
  # PUT /reports/1
  # PUT /reports/1.json
  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
      #  format.json { head :ok }
      else
        format.html { render action: "edit" }
       # format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      #format.json { head :ok }
    end
  end
  
  def set_assets
    @operations = current_user.operations.all
    @lands = current_user.lands.all
  end
  
  private 
  
#  def apf
 #   operation = current_user.operations.where("name = ?", params[:report][:operation_name]).first
 #   operation.fuel_dk * params[:report][:decker].to_d
#  end
  
#  def salary_and_apf
 #   operation = current_user.operations.where("name = ?", params[:report][:operation_name])
 #   operation = operation.first 
#    salary = operation.price_dk * params[:report][:decker].to_d 
 #   apf = operation.fuel_dk * params[:report][:decker].to_d
 #   { :salary => salary, :approximate_fuel_cost => apf }
 # end
end
