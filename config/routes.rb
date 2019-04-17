Rails.application.routes.draw do
  namespace :admins do
    get 'exams/index'
  end
  resources :exams
  ##### Admins Route #####
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  authenticated :admin do
    root to: redirect('/admins/'), as: "admin_authenticated_root"
    get '/admins/sign_out', to: 'admins/sessions#destroy'
    namespace :admins do
      get '/', to: "landing_page#index", as: "home"
      get '/exams', to: "exams#index", as: "exams"
      get '/exams/:title', to: 'exams#show', as: "exam_show"
      get '/exams/:title/checkin', to: 'exams#checkin', as: "exam_checkin"
      post '/exams/:title/checkin/:enroll_id', to: 'exams#checkin_post', as: "exam_checkin_post"
      # can CRUD organizations
      resources :organizations
    end
  end

  ##### Organizations Route #####
  devise_for :organizations, controllers: { sessions: 'organizations/sessions' }
  authenticated :organization do
    root to: redirect('/organizations/'), as: "organization_authenticated_root"
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
    registrations:  'candidates/registrations',
    passwords: 'candidates/passwords' 
  }
  authenticated :candidates do
    root to: redirect('/'), as: "candidate_authenticated_root"
  end
  
  ##### Global Route #####
  root to: 'catalogues#index'
  get  "/catalogues/:title", to: "catalogues#show",   as: "catalogues"
  post "/catalogues/:title", to: "catalogues#enroll"
  post "/catalogues/:title/payment", to: "catalogues#payment", as: "catalogue_payment"
  get "/catalogues/:title/cheat", to: "catalogues#cheat", as: "catalogue_cheat"
  post "/catalogues/:title/attach", to: "catalogues#attach_new", as: "catalogue_attach_new"
  delete "/catalogues/:title/attach/:id", to: "catalogues#attach_remove", as: "catalogue_attach_remove"

  # get 'catalogues/index'
  get '/admins', to: redirect('/admins/sign_in')
  get '/organizations', to: redirect('/organizations/sign_in')



  resources :buildings
  resources :rooms

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
