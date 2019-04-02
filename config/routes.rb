Rails.application.routes.draw do
  ##### Admins Route #####
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  authenticated :admin do
    root to: redirect('/admins/'), as: :authenticated_root
    namespace :admins do
      get '/', to: "landing_page#index"
      # can CRUD organizations
      resources :organizations
    end
    get '/admins/sign_out', to: 'admins/sessions#destroy'
  end

  ##### Organizations Route #####
  devise_for :organizations, controllers: { sessions: 'organizations/sessions' }
  
  ##### Candidates Route #####
  
  
  
  ##### Global Route #####
  # root to: 'buildings#index'
  get '/admins', to: redirect('/admins/sign_in')
  get '/organizations', to: redirect('/organizations/sign_in')
  resources :buildings
  # authenticated :user do
  #   root to: 'papers#index', as: :authenticated_root
  # end
  # root to: redirect('/users/sign_in')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
