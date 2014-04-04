Proyecto::Application.routes.draw do
  
  root :to => "articles#index"

  resources :articles do
    resources :comments
  end
  resources :users
   post '/articles/like' => 'articles#like' 
   get '/articles/administrador' => 'articles#administrador' 
end
