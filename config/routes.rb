Rails.application.routes.draw do
  get 'usertasklists/create'
  get 'usertasklists/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  patch 'tasks/:id', to: 'tasks#update'
  
  resources :tasks, only: [:index, :show, :new, :create,:edit,:destroy]
  resources :users, only: [:index, :show, :new, :create]
end
