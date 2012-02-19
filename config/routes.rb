Paceliners::Application.routes.draw do
  resources :rides, :except => [:show]
  get 'rides/add' => 'rides#new'

  root :to => 'home#index'
end
