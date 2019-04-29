Rails.application.routes.draw do
  get '/' => 'coordinators#home'
  
  get '/registries' => 'registries#index'
  post '/registries' => 'registries#create'
  get '/registries/:registry_id' => 'registries#show'

  post '/login' => 'coordinators#login'
  post '/register' => 'coordinators#create'
  get '/coordinators' => 'coordinators#index'
  post '/coordinators' => 'coordinators#create'
  get '/coordinators/:coordinator_id' => 'coordinators#show'
  get '/logout' => 'coordinators#logout'

  get '/enrollments/new' => 'enrollments#new'
  post '/enrollments' => 'enrollments#create'

  post '/participants' => 'participants#create'
  get '/participants/new' => 'participants#new'
end
