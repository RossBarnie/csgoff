Csgoff::Application.routes.draw do

  root 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/logout' => 'session#destroy'

  post "/auth/steam/callback" => "session#callback"

end
