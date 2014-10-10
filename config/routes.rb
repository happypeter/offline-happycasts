Offline::Application.routes.draw do
  resources :issues, :users do
    resources :comments
  end
  root to: "users#welcome"
  get "login" => "users#login", :as => "login"
  get "signup" => "users#signup", :as => "signup"
  post "create_login_session" => "users#create_login_session"
  delete "logout" => "users#logout", :as => "logout"
  resources :users, only: [:create, :show, :update]
  get "/:username" => "users#show", :as => "profile"
end
