Rails.application.routes.draw do


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # homes
  get '/about' => 'homes#about'

  # users
  resources :users, only: [:show, :edit, :update]
  get '/users/quit_check' => 'users#quit_check'
  patch '/users/withdraw' => 'users#withdraw'

  # tasks
  resources :tasks, only: [:index, :new, :create, :edit, :update]
  get '/today' => 'tasks#today'
  get '/tasks/:id/complete' => 'tasks#complete'

end
