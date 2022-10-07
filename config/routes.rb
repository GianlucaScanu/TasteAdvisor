Rails.application.routes.draw do
  get 'home/index'
  devise_for :reviewers
  devise_for :restaurants
  resources :reports
  resources :dishes
  resources :restaurants
  resources :reviews
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

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
