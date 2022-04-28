Rails.application.routes.draw do
  root to: "homes#homepage"
  get '/show/:id' ,to:"homes#showpage" 
  get '/new' ,to:"homes#new"
  post '/create-post', to: "homes#create" 
  get '/edit/:id' ,to: "homes#edit"
  post '/updated/:id' ,to: "homes#update"

  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  
end
