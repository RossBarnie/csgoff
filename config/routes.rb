Csgoff::Application.routes.draw do

  root 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/logout' => 'session#destroy', as: :logout

  get '/session/new' => 'session#new', as: :new_session
  post "/auth/steam/callback" => "users#new"

end
