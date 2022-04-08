Rails.application.routes.draw do
  resources :interventions
  post 'twilio/sms'
  resources :quotes
  get 'quotes/quote'
  get 'errors/not_found'
  get 'errors/internal_server_error'

  root "home#index"
  
 
  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/setup' => 'dropbox#setup'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'

  resources :leads, :path =>'leads'
  post '/leads', to: 'leads#create'


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # namespace :admin do
  #   controller :admin do
  #     get 'data/index', to: 'data#index'
  #     # get '/', action: :index
  #     # get :login
  #     # get :logout
  #   end
  #   # resources :events
  # end
  get 'rails_admin/data/index', to: 'data#index'
  get 'admin/rails_admin/data/index', to: 'data#index'
  get 'rails_admin/data/playbriefing', to: 'data#playbriefing'
  get 'rails_admin/data/map', to: 'data#map'


  # get '/', to: "home#index"
  get "residential", to: "home#residential"
  get "commercial", to: "home#commercial"
  get "interventions", to: "intervention#index"
  
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  resources :quotes do 
    member do
      get 'preview'
    end
  end
  
  match "404", to: "errors#not_found", via: :all
  match "500", to: "errors#internal_server_error", via: :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
Rails.application.routes.draw do

  get 'get_building_by_customer/:customer_id', to: 'interventions#get_building_by_customer'  
  

  get 'get_battery_by_building/:building_id', to: 'interventions#get_battery_by_building'  
  
  get 'get_column_by_battery/:battery_id', to: 'interventions#get_column_by_battery'

  get 'get_elevator_by_column/:column_id', to: 'interventions#get_elevator_by_column'

 end