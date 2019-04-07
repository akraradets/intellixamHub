Rails.application.routes.draw do
  resources :exams
  ##### Admins Route #####
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  authenticated :admin do
    root to: redirect('/admins/'), :as => "admin_authenticated_root"
    get '/admins/sign_out', to: 'admins/sessions#destroy'
    namespace :admins do
      get '/', to: "landing_page#index"
      # can CRUD organizations
      resources :organizations
    end
  end

  ##### Organizations Route #####
  devise_for :organizations, controllers: { sessions: 'organizations/sessions' }
  authenticated :organization do
    root to: redirect('/organizations/'), :as => "organization_authenticated_root"
    get '/organizations/sign_out', to: 'organizations/sessions#destroy'
    namespace :organizations do
      get '/', to: "landing_page#index"
      # can CRUD organizations
      resources :organizations
    end
  end  
  ##### Candidates Route #####
  devise_for :candidates, controllers: { 
    sessions: 'candidates/sessions', 
    :registrations => 'candidates/registrations' 
  }
  
  
  ##### Global Route #####
  root to: 'catalogues#index'
  get "/catalogues/:title(.:format)", as: :catalogues, to: "catalogues#show"

  # get 'catalogues/index'
  get '/admins', to: redirect('/admins/sign_in')
  get '/organizations', to: redirect('/organizations/sign_in')



  resources :buildings
  resources :rooms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
