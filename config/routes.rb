Rails.application.routes.draw do
  ##### Guests Route #####
  root to: 'buildings#index'
  ##### Admins Route #####
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  get '/admins/sign_out', to: 'admins/sessions#destroy'
  # root to: redirect('/users/sign_in')
  resources :buildings
  ##### Candidates Route #####
  ##### Organizations Route #####
  # authenticated :user do
  #   root to: 'papers#index', as: :authenticated_root
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
