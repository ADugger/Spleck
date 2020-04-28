Rails.application.routes.draw do
  resources :favorites
  devise_for :users
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "restaurants#index"
  
  post 'restaurants/:id/edit', to: 'restaurants#edit', as: 'edit'
  post 'restaurants/:id/upvote', to: 'votes#upvote', as: 'upvote'
  post 'restaurants/:id/downvote', to: 'votes#downvote', as: 'downvote'
  post 'restaurants/:id/addfave', to: 'favorites#add_favorite', as: 'addfave'
  post 'restaurants/:id/removefave', to: 'favorites#remove_favorite', as: 'removefave'
  get  'users/account_summary', to: 'user#show', as: 'account_summary'
  post 'restaurants/:id/comment/:body', to: 'comments#add_comment', as: 'comment'
end
