Offline::Application.routes.draw do

  resources :events, :users do
    resources :comments
  end

  controller :sendmails do
    get '/sendmails/new' => 'sendmails#newmail'
    post '/sendmails' => 'sendmails#sendmail'
  end

  match "user_login" => "users#login"
  match "login" => "users#login_form"
  match "about" => "info#about"
  match "logout" => "users#logout", :as => "logout"
  root :to => 'events#index'
  match "signup" => "users#signup", :as => "signup"

end
