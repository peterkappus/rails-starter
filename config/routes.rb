Rails.application.routes.draw do
  get '/admin', to: "admin#index"
  post '/admin/import'

  devise_for :users, sign_out_via: [:get, :post, :delete], :controllers => { :registrations => "registrations" }, :path_prefix => 'auth'
  #resources :users


  get '/about', to: 'home#about'
  get '/sign_in', to: 'home#debug_sign_in', as: :test_sign_in

  #post the form
  post '/search', to: 'home#search', as: :search

  #show the results
  get '/search', to: 'home#search'

  root 'home#index'
  #root 'teams#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
