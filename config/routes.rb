Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, :posts, :destinations
  root 'bloggers#home'
  post '/post/:id/like', to: 'posts#like', as: 'like_post'
  post '/post/:id/unlike', to: 'posts#unlike', as: 'unlike_post'
end
