Offline::Application.routes.draw do
  resources :events
  resources :users
  root :to => 'events#index'
end
