Rails.application.routes.draw do
 
  devise_for :reviewers#, controllers: { omniauth_callbacks: 'reviewer/omniauth_callbacks' }
  devise_for :restaurants

  devise_for :omni_users, controllers: { omniauth_callbacks: 'omni_users/omniauth_callbacks' }

  get 'search/index'
  get 'search/show'
  get 'search/edit'
  get 'search/update'
  get 'search/search_restaurant'
  get 'search/search_dish'
  get 'search/index'
  get 'search/show'
  get 'search/edit'
  get 'search/update'
  get 'home/index'
# This is for being able of testing the application with cucumber. Since we are not using devise defaults login
  match 'login/:id' => 'restaurant#login', :as => 'login', :via => [:get] if Rails.env.test?

  
  resources :reports, :except => :index
  resources :dishes, :except => :index
  resources :restaurants, :except => :index
  resources :reviews, :except => :index
  resources :reviewers, :except => :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

  get '/search_restaurant', to: 'search#search_restaurant'
  get '/search_dish', to: 'search#search_dish'

  #default, per percorsi inesistenti (es.No route matches [GET])
  #se danno problemi commentare
  #get '*all', to: 'home#index', constraints: lambda { |req|
   # req.path.exclude? 'rails/active_storage'
  #}
  
  #le recensioni possono essere viste ed accedute solo attraverso i ristoranti e recensori, ma non tutte le funzionalita'
  #resources :restaurant do
	#	resources :reviews, only: [:new, :show, :create]
  #  resources :dish, only: [:new, :show, :create, :delete]
	#end
  #idem
  #resources :reviewer do
	#	resources :reviews, only: [:show, :edit, :index]
	#end

  #resources :restaurant, only: [:index, :new, :show, :create]


end
