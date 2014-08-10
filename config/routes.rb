Csgoff::Application.routes.draw do

  root 'static_pages#home'
  get '/about' => 'static_pages#about'

  post "/auth/steam/callback" => "static_pages#callback"

end
