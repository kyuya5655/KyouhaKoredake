Rails.application.routes.draw do


  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root :to => 'homes#top'

  # homes
  get '/about' => 'homes#about'

  # tasks
  resources :tasks, only: [:index, :new, :create, :edit, :update] do
  collection do
      get 'search'
    end
  end
  delete 'tasks/:id' => 'tasks#destroy'
  get '/task_complete' => 'tasks#complete'
  get '/today' => 'tasks#today'

  # users
  get '/user' => 'users#show'
  get '/user/edit' => 'users#edit'
  patch 'user' => 'users#update'
  get '/user/quit_check' => 'users#quit_check'
  patch '/user/withdraw' => 'users#withdraw'



end
