class InterventionsController < ApplicationController

  require 'uri'
  require 'open-uri'
  require 'fileutils'
  require 'json'
  require 'rest_client'


  before_action :set_intervention, only: %i[ show edit update destroy ]

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
    
  end
  def get_building_by_customer
    @building = Building.where("customer_id = ?", params[:customer_id])
    respond_to do |format|
      format.json { render :json => @building }
    end
  end 
  def get_battery_by_building
    @battery = Battery.where("building_id = ?", params[:building_id])
    respond_to do |format|
      format.json { render :json => @battery }
    end
  end 
  def get_column_by_battery
    @column = Column.where("battery_id = ?", params[:battery_id])
    respond_to do |format|
      format.json { render :json => @column }
    end
  end 
  def get_elevator_by_column
    @elevator = Elevator.where("column_id = ?", params[:column_id])
    respond_to do |format|
      format.json { render :json => @elevator }
    end
  end 
  # def course_search
  #   if params[:customer].present? && params[:customer].strip != ""
  #     @building = Building.where("customer_id = ?", params[:customer])
  #   else
  #     @building = Building.all
  #   end
  


  # GET /interventions/new
  def new
    @theCustomer
    @intervention = Intervention.new
    @customer = Customer.all
    @building = Building.all
    @employee = Employee.all
    @battery = Battery.all
    @column = Column.all
    @elevator = Elevator.all
    @author = current_user.email
   
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    # respond_to do |format|
      @intervention = Intervention.new(intervention_params)

        
      
      
        
    
      
          
          @intervention = Intervention.new(intervention_params)
          respond_to do |format|
            if @intervention.save
      
              author = @author
              
              if @intervention.customerID != nil 
                companyName = Customer.find(@intervention.customerID).Company_Name
              else
                companyName = "n/a"
              end
              if @intervention.buildingID == nil
                @intervention.buildingID = "n/a"
              end
              if @intervention.batteryID == nil
                @intervention.batteryID = "n/a"
              end
              if @intervention.columnID == nil
                @intervention.columnID = "n/a"
              end
              if @intervention.elevatorID == nil
                @intervention.elevatorID = "n/a"
              end
              
              if @intervention.employee == nil
                @intervention.employeeI= "n/a"
                employeeName = "n/a"
              else
                employee = Employee.find(@intervention.employee)
                employeeName = employee.first_name + " " + employee.last_name
              end
      
              if @intervention.report == nil
                @intervention.report = "n/a"
              end
      
                data = {
                  "status": 2, 
                  "priority": 1,
                  "email": "admin@rocketelevators.com",
                  "description": 
                    "A new intervention has been submitted by employee  for the company, " + companyName + ". The building ID is " + @intervention.buildingID + "; battery ID is " + @intervention.batteryID + ". The column ID is " + @intervention.columnID + ". The elevator ID is " + @intervention.elevatorID + ". The employee to be assigned to the task is " + employeeName + ". Description of the request for the intervention is: " + @intervention.report, 
                  "type": "Incident",
                  "subject": "New intervention submitted for building No." + @intervention.buildingID
                }
      
                
                data_json = JSON.generate(data)
                  request = RestClient::Request.execute(
                    method: :post,
                    url: ENV['fRESHDESK_API_Domain'],
                    user: ENV['fRESHDESK_API_KEY'],
                    password: 'X',
                    payload: data_json,
                    headers: {"Content-Type" => 'application/json'}
                  )
        
                  logger.debug "----------- #{request.code} --------------"
      
              format.html { redirect_to root_path, notice: "Intervention was successfully created." }
              format.json { render :show, status: :created, location: @intervention }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @intervention.errors, status: :unprocessable_entity }
            end
          end
        end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy

    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author, :customerID, :buildingID, :batteryID, :columnID, :elevatorID, :employee, :report)
    end

  end

