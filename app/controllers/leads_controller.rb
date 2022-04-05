class LeadsController < ApplicationController

  require 'uri'
  require 'open-uri'
  require 'fileutils'
  require 'json'
  require 'rest_client'


  def new
      @lead = Lead.new
  end

  def show
    @lead = Lead.find(params[:id])

    client = DropboxApi::Client.new(ENV["DROPBOX_OAUTH_BEARER"])
    
    #check if client folder exists and creates client folder if file does not exist
    results = client.list_folder "/Rocket-Elevators-AI-folder/"
    contentList = []
    results.entries.each do |f|
      contentList.push(f.name)
    end
    if (contentList.include? @lead.cie_name) != true
      client.create_folder "/Rocket-Elevators-AI-folder/" + @lead.cie_name
    end
    
    cie = @lead.cie_name.to_s.gsub(/\s+/, '')
    #extract attachments from database
    filepath = Rails.root.join('public','uploads', cie)

    Dir.glob(filepath+ "*") do |f|
     filename = File.basename(f)
     File.open("#{f}") do |file|
      client.upload_by_chunks "/Rocket-Elevators-AI-folder/" + cie + "/" + filename, file, :mode => :add
      end
    end  
    @lead.update({"attached_files" => nil})

    redirect_to rails_admin_url, notice: "Files were successfully sent to Dropbox. Now please manually add this lead as a customer. Sorry I didn't have time to make this happen for you automatically..."
  end

  def update
    respond_to do |format|
      if @lead.update(quote_params)
        format.html { redirect_to lead_url(@lead), notice: "Lead was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

    # POST /leads
  def create
    @lead = Lead.new(lead_params)

    cie = @lead.cie_name.to_s.gsub(/\s+/, '')
    dirname = Rails.root.join('public','uploads', cie)
    unless File.directory?(dirname)
      FileUtils.mkdir_p(dirname)
    end
    
    if @lead.attached_files != nil
      uploaded_io = params[:lead][:attached_files]
      File.open(Rails.root.join('public','uploads', cie, uploaded_io.original_filename),'wb') do |file|
        file.write(uploaded_io.read)
      end
    end
    
      if @lead.full_name == nil
        @lead.full_name = "n/a"
      end
      if @lead.cie_name == nil
        @lead.cie_name = "n/a"
      end
      if @lead.email == nil
        @lead.email = "n/a"
      end
      if @lead.phone == nil
        @lead.phone = "n/a"
      end
      if @lead.project_name == nil
        @lead.project_name = "n/a"
      end
      if @lead.project_description == nil
        @lead.project_description = "n/a"
      end
      if @lead.department_in_charge == nil
        @lead.department_in_charge = "n/a"
      end
      if @lead.message == nil
        @lead.message = "n/a"
      end
      if @lead.attached_files == nil
        has_attachment = "not"  
      else
        has_attachment = ""
      end

      companyName = @lead.cie_name.to_s.gsub(/\s+/, '')

      filepath = Rails.root.join('public','uploads', companyName)
      attachments = []
      Dir.glob(filepath+ "*") do |f|
        filename = File.basename(f)
        attachments.push(File.new(f, 'rb')) 
      end  

      site = RestClient::Resource.new(ENV['FRESHDESK_URL'], ENV["FRESHDESK_API_KEY"], 'X')
      url = ENV['FRESHDESK_URL']
    
      respond_to do |format|
        if @lead.save
    
          if @lead.attached_files != nil 
            data = {
              
              "status": 2, 
              "priority": 1,
              "email": @lead.email,
              "description": 
                "The contact" + @lead.full_name + " from company " + @lead.cie_name + " can be reached at email " + @lead.email + " and at phone number " + @lead.phone + ". " + @lead.department_in_charge + " has a project named " + @lead.project_name + " which would require contribution from Rocket Elevators. The project description is " + @lead.project_description + ". Attached message: " + @lead.message + ". The Contact has " + has_attachment + " uploaded an attachment.",
              "type": "Question",
              "subject": @lead.full_name + " from " + @lead.cie_name,
              "attachments": attachments
            }
              # site.post(data, :content_type => 'multipart/form-data')
    
              request = RestClient::Request.execute(
                method: :post,
                url: 'https://rocketelevatorsai.freshdesk.com/api/v2/tickets',
                user: ENV["FRESHDESK_API_KEY"],
                password: 'X',
                payload: data,
                headers: {"Content-Type" => 'multipart/form-data'}
              )
    
              logger.debug "------------ attachment #{request.code} -------------"
    
          else
              data_wo_attachment = {
                status: 2, 
                priority: 1,
                subject: "#{@lead.full_name} from #{@lead.cie_name}",
                email: "#{@lead.email}",
                description: 
                  "The contact" + @lead.full_name + " from company " + @lead.cie_name + " can be reached at email " + @lead.email + " and at phone number " + @lead.phone + ". " + @lead.department_in_charge + " has a project named " + @lead.project_name + " which would require contribution from Rocket Elevators. The project description is " + @lead.project_description + ". Attached message: " + @lead.message + ". The Contact has " + has_attachment + " uploaded an attachment.",
                type: "Question"
              }
              data_json = JSON.generate(data_wo_attachment)
              # site.post(data_json, :content_type => "application/json"){ |response, request, result, &block|
              #   logger.debug "----------- #{response.code} --------------"
              #   if [301, 302, 307].include? response.code
              #     redirected_url = response.headers[:location]
              #   # else
              #   #   response.return!(request, result, &block)
              #   end
              # }
    
              request = RestClient::Request.execute(
                method: :post,
                url: "https://rocketelevatorsai.freshdesk.com/api/v2/tickets",
                user: ENV["FRESHDESK_API_KEY"],
                password: 'X',
                payload: data_json,
                headers: {"Content-Type" => 'application/json'}
              )
    
              logger.debug "----------- #{request.code} --------------"
    
          end
    
          format.html  { redirect_to root_path, notice: 'Your message has been successfully sent!' }
          format.json  { render json: Lead.create(lead_params) }
        else
          format.html  { redirect_to root_path, notice: 'Your message was not sent successfully.' }
          format.json  { render :json => @lead.errors, :status => :unprocessable_entity }
        end
      end

  end

  private

  def lead_params
    params.require(:lead).permit(:full_name, :cie_name, :email, :phone, :project_name, :project_description, :department_in_charge, :message, :attached_files)
  end

end
