Proyecto::Application.routes.draw do
  
  root :to => "articles#index"

  resources :articles do
    resources :comments
  end
  resources :users
  get '/admin/menu' => 'admin#menu'
  get '/admin/filtrar' => 'admin#filtrar'
 
  get '/admin/search_title' => 'admin#search_title'
  get '/admin/search_word' => 'admin#search_word'
  get '/admin/search_date' => 'admin#search_date'
  get '/admin/search_doble_date' => 'admin#search_doble_date'

  post '/articles/like' => 'articles#like' 
  post '/articles/dislike' => 'articles#dislike' 
#  get '/articles/administrador' => 'articles#administrador' 

end
