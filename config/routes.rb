Rails.application.routes.draw do
  devise_for :users, 
    controllers: { registrations: 'registrations' } 
  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'
  post '/posts/:post_id/photos', to: 'photos#create', as: 'post_photos'
  resources :posts, only: [:index,:new ,:create ,:show ,:destroy] do
    resources :photos, only: [:create]
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
