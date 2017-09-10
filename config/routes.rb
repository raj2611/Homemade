Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users, only: [:index, :show]
  as :user do

end
  #devise_for :users, :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/home', to: 'pages#home'
  get '/sortlike', to: 'contents#sortlike'
  resources :contents do
  	member do
  		post 'like'
  	end
  end

end
