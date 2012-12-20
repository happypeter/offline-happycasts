Offline::Application.routes.draw do
  resources :events
  resources :users
  root :to => 'events#index'
  match "signup" => "users#signup", :as => "signup"
end
