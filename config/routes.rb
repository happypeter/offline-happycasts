Offline::Application.routes.draw do
  resources :events
  resources :users
  match "user_login" => "users#login"
  match "login" => "users#login_form"
  root :to => 'events#index'
  match "signup" => "users#signup", :as => "signup"
end
