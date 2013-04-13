Offline::Application.routes.draw do
  get "sessions/login"

  resources :events
  resources :users
  #match "user_login" => "users#login"
  #match "login" => "users#login_form"
  match "about" => "info#about"
  #match "logout" => "users#logout", :as => "logout"
  root :to => 'events#index'
  match "signup" => "users#signup", :as => "signup"

  controller :sessions do
    get '/login' => 'sessions#login'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
  end

end
