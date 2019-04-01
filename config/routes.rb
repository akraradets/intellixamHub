Rails.application.routes.draw do
  ##### Guests Route #####
  # root to: 'buildings#index'
  get '/admins', to: redirect('/admins/sign_in')
  ##### Admins Route #####
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  authenticated :admin do
    root to: 'buildings#index', as: :authenticated_root
    namespace :admins do
      get 'landing_page/index'
    end
    get '/admins/sign_out', to: 'admins/sessions#destroy'
  end
  # root to: redirect('/users/sign_in')
  resources :buildings
  ##### Candidates Route #####
  ##### Organizations Route #####
  # authenticated :user do
  #   root to: 'papers#index', as: :authenticated_root
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
