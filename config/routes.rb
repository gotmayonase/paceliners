Paceliners::Application.routes.draw do
  resources :rides

  root :to => 'home#index'
end
