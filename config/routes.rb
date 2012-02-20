Paceliners::Application.routes.draw do
  resources :rides, :except => [:show] do
    get 'check_similar', :on => :collection
  end
  get 'rides/add' => 'rides#new'

  root :to => 'home#index'
end
