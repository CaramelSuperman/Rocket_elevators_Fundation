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

        
      fRESHDESK_API_KEY = "VKedLmalpZ1miMed62"
      fRESHDESK_API_Domain = "https://Codeboxx-supportdesk.freshdesk.com/api/v2/tickets"
        
    
      respond_to do |format|
        if @intervention.save
          format.html { redirect_to "/", notice: "Thank you. We will communicate with you shortly!" }
          format.json { render :show, status: :created, location: @intervention }
          puts @author
          # attachment_exists = @lead.attached_file_stored_as_binary.attached?
          # # user_is_customer = Customer.where(email_of_the_company_contact: "#{@lead.email}").present? || Customer.where(technical_manager_email_for_service: "#{@lead.email}").present?
          # site = RestClient::Resource.new(fRESHDESK_API_Domain,fRESHDESK_API_KEY, 'X')
          
          #   data_hash = {
          #     "status": 2,
          #     "priority": 1,
          #     "subject": "#{@intervention.result} from #{@intervention.author}", 
          #     "description": 
          #     "The requester #{@intervention.author} started a new intervention
          #     # for company #{@intervention.customerID} 
          #     On builging ID #{@intervention.buildingID} // 
          #     On battery ID #{@intervention.batteryID} //
          #     On column ID #{@intervention.columnID} //
          #     On elevator ID #{@intervention.elevatorID} //
          #     Job is done by employee #{@intervention.employee} //
          #     The job description #{@intervention.report}
          #       ",
              
          #     "email": "#{@author}",
          #     "type": "Question"
          #   }
            
          #   data_json = JSON.generate(data_hash)
          #   # site.post(data_json)
          #   RestClient::Request.execute(
          #     method: :post,
          #     url: fRESHDESK_API_Domain,
          #     user:fRESHDESK_API_KEY ,
          #     password: 'X',
          #     payload: data_json,
          #     headers: {"Content-Type" => "application/json"},
          #   )
  
        
  
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @intervention.errors, status: :unprocessable_entity }
        end
      end
    end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
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

