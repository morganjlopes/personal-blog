Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  namespace :admin do
    resources :posts
    resources :websites
    resource :settings, only: [:show, :create]
  end
  
  constraints subdomain: /.+/ do
    # User root + subdomain - ex. root_url(subdomain: 'example')
    get '/', to: 'public/websites#show'
  end

  scope module: 'public' do
    resources :posts, 
              only: [:index, :show], 
              path: 'posts'

    get "pages/home"
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "public/pages#home"
end
