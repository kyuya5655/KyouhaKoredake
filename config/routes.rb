Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root :to => 'homes#top'

  # homes
  get '/about' => 'homes#about'

  # users
  get '/user' => 'users#show'
  get '/user/edit' => 'users#edit'
  patch 'user' => 'users#update'
  get '/user/quit_check' => 'users#quit_check'
  patch '/user/withdraw' => 'users#withdraw'

  # tasks
  resources :tasks, only: [:index, :new, :create, :edit, :update]
  get '/today' => 'tasks#today'
  delete 'task/:id' => 'tasks#destroy'
  get '/tasks/:id/complete' => 'tasks#complete'

end
