MovieApp::Application.routes.draw do
  root to: 'movies#index'
  resources :movies
  get "movies/search" => 'movies#search'
  post "movies/search" => 'movies#search'
end
