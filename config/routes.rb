Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # homes
  get '/top' => 'homes#top'
  get '/about' => 'homes#about'

  # users

  resources :users, only: [:show, :edit, :update]
  get '/users/quit_check' => 'users#quit_check'
  patch '/users/withdraw' => 'users#withdraw'

  # tasks
  resources :tasks, only: [:index, :new, :create, :edit, :update]
  get '/today' => 'tasks#today'

  # presents
  get '/present/:id' => 'presents#show'

end
