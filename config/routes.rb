Rails.application.routes.draw do
  root 'application#index'

  # User Routes
   resources :users, exclude: [:index]

  # Idea Routes 
   resources :ideas

  # Session Routes
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # Like Routes
  post 'likes' => 'likes#create'
  delete 'likes/:id' => 'likes#destroy'
end
