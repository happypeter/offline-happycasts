Offline::Application.routes.draw do
  resources :events
  resources :users
  match "user_login" => "users#login"
  match "login" => "users#login_form"
  match "logout" => "users#logout", :as => "logout"
  root :to => 'events#index'
  match "signup" => "users#signup", :as => "signup"
end
