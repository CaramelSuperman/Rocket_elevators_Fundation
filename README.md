# README

* 1 - HOW TO GET THIS APPLICATION UP AND RUNNING
* 2 - SET UP POSTGRES AS SECOND DATABASE
* 3 - APIs

##  HOW TO GET THIS APPLICATION UP AND RUNNING

* --- Ruby version 
Ruby version required is 2.7.5 to make sure the compatibility is not compromised

* --- System dependencies (Windows)
    - Install WSL 2 
    - Install Ubuntu
    - Install curl to install and compile software packages - If your system is macOS
    - Install rbenv
    - Install rails, version 5.2.6
    - Install MySQL
    - Install postgresql
    - Install pg, nokogiri and others gems

* --- System dependencies (macOS)
    - Install Homebrew to install and compile software packages - If your system is macOS
    - Install rbenv
    - Install rails, version 5.2.6
    - Install MySQL
    - Install postgresql
    - Install pg, nokogiri and others gems

* Configuration
    * --- Git
        - git config --global color.ui true
        - git config --global user.name "YOUR NAME"
        - git config --global user.email "YOUR@EMAIL.com"
        - ssh-keygen -t rsa -C "YOUR@EMAIL.com" 
        - Generate an SSH KEY and add it to your Github account

* Database creation
    - "rake db:create" to create a new database
    -  Put Gem devise in gemfiles
    - "bundle install"
    - "rails g devise:install"

* Database initialization
    - "rails g devise user" (set up the user model)
    - "rake db:migrate"
    - "rake db:seed" (to populate tables with existing data)

* How to run the test suite
    - In your root directory, type "rails s" to lunch the server
    - Run your local server in a browser : http://localhost:3000/

* Deployment instructions
    - Add required gems for the deploy
    - Create specifics files 
        - Cap File
        - Deploy.rb 
        - Production.rb
    - Link your Git
    - Once the sever is set-up with the SSH key and ready ;
        - Make sure your Github main branch is up to date
        - "cap production deploy'
            - Deploy will make an error : database is missing
            - Connect to the SSH server with the right IP
            - Create a files database.yml in the proper folder and right the proper information of the server host
        - "cap production puma:config"
        - "cap production puma:nginx_config"
        - Set up your cloudflare (DNS configuration)

## SET UP POSTGRES AS SECOND DATABASE
* To set up postgres:
    - Make sure you download postgres and have it working on your computer
    - bundle install (if you haven’t done so)
        then:
    1. rake postgres:db:create
    2. rake postgres:db:migrate
    3. rake postgres:db:import:fact_quotes
    4. rake postgres:db:import:fact_contacts
    5. rake postgres:db:import:fact_elevators
    6. rake postgres:db:import:dim_customers
    7. rake postgres:db:import:fact_interventions

* Every time you save new data to our database, and want to include this data in the data warehouse for analysis. Please re-do steps 3-6, or the command for the corresponding table.

* Some other commands for postgres:
    - To create a new migration: 
        rails g postgres_migration create_awesome_table
        rake postgres:db:migrate
    - To drop the database
        rake postgres:db:drop (edited) 

## APIs

### Notify: 
Notify README

CONFIGURATION
The first thing to do is to register and activate your Notify account. After the first sign-in, you need to include your clientId and secret key in the http headers. You can find this information in the user settings page where the Notify credentials are.

Once that is set up, you have to make an API call. Go to https://rapidapi.com/geert/api/notify-eu/ in the code snippets, select (Ruby) net::http and copy-paste it in Visual Studio Code. Make sure to add these 3 gems:
require 'uri'
require 'net/http'
require 'openssl'

After, a message will be sent to your inbox. You can check the logs in the Notify app to see what was sent.

Next, you need to select the smtp channel and configure it with its unique key.

MESSAGE TEMPLATE
Create a new template and assign your selected channel. Add the content such as the text and logo. In the HTML editor, you need to add {{ fullName }} next to Greetings and  {{ projectName }} next to project.

In Visual Studio Code, you need to call the Rocket Elevators contact form in order for these variables to print in your message. 
\"name\": \"" + @lead.full_name + "\",
\"email\": \"" + @lead.email + "\"

TESTING
Once your code is complete, you can go on the Rocket Elevators’ website, fill out the form and you should receive a confirmation email in your inbox with the full name and the project name you entered. To troubleshoot, you can check in Notify’s Log tab to make sure the api as well as the content work.

### Freshdesk

When a potential customer submits their contact information through the Contact Us form on the home page, or when he/she calculates a quote using the quote form, all the information, including any attachments from the contact form, are sent to Freshdesk to allow Rocket Elevators to manage their leads and quotes more easily.

Please contact us for login credentials to the freshdesk console.

### AWS Polly

When an admin logins into the admin panel, they have the option to play an audio briefing of some key information derived from the database. The link to play this audio is on the bottom left as "Play Briefing" under "Links".

### Dropbox

When a lead becomes a customer, the admin have the option to send any relevant files associated with the lead to be sent to Dropbox. To do this, they need to click on the "show-in-app" button next to the lead they want to mark. The button will prompt Dropbox to save all the relevant files, and any files saved in the MYSQL database will be erased. 

### Google Maps

Admin now has the option to view a map of where their customers' buildings are located. Simply login into admin and click on "Show Customers On A Map" on the bottom left of the admin homepage under "Links". Once you are on the map, you are able to click on the markers to view detailed information about the building. 

### Slack

Steps to configure slack:
- create an app
- Add the app to the workspace
- Install the slack-notifier gem
- Create a web hook  and adding it to you code

### Twilio

When an elevator status is changed from any non-Intervention status to "Intervention" a text message is immediately sent to the technician in charge of the elevators alerting him that an elevator needs to be checked and gives him the elevator ID at the same time. You can try this very easily by changing an elevator status in the admin pannel.

### Intervention table
intervention mysql2 table added. 


### Intervention form 
new intervention form added 
only accesible by admin users
(small problem, needs to reload the site intervention/new to make the summit button work)
it saves the form in the intervention table




### Intervention api
use this link to see the api GET and the two PUTS
https://documenter.getpostman.com/view/20281199/UVyxQtsk
GET status get the interventions with "pending" statuses
PUT changeStatusToInProgres changes the status to in Progress and adds a start date for that intervention
PUT changeStatusToComplted changes the status to completed and adds a end date for that intervention