Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'

  scope 'user' do
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
  end
  
  # This will provide you with URLs such as /bob/articles/1 and will allow you to reference the username part of the path as params[:username] in controllers, helpers, and views.

  #scope ':first_name' do
    #resources :workout
  #end

  resources :comments
  resources :workouts
  resources :users
end
