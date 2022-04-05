RailsAdmin.config do |config|

  config.authorize_with do
    redirect_to main_app.root_path unless user_signed_in? and current_user.admin?
  end
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  # config.model 'Data' do
  #   list do
  #     field :data
  #   end
  # end
  config.excluded_models = [ Map ]

  config.navigation_static_links = {
    'Play Briefing' => 'rails_admin/data/playbriefing',
    'Show Customers on Map' => 'rails_admin/data/map',
    'Data Warehouse' => 'rails_admin/data/index',
    
  }


  config.actions do
    dashboard                       
    index                         
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  # show_in_app do
  #   i18n_key :customized
  # end       

  # config.model 'Lead' do
  #   edit do
  #     configure :is_customer do
  #     end
  #   end

end
 