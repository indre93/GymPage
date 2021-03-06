Rails.application.routes.draw do
   root 'sessions#welcome'
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   delete '/logout' => 'sessions#destroy'

   resources :users, only: [:new, :create, :show] do
      resources :workouts, only: [:show]
   end
   
   resources :workouts do
      resources :routines, only: [:new, :create]
   end

   resources :exercises, only: [:index, :show] do
      resources :routines, only: [:index]
   end
   
   resources :routines, only: [:index]
   
   get '/auth/:provider/callback' => 'sessions#google'
end
