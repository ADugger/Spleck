Rails.application.routes.draw do
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "restaurants#index"
  
  post 'restaurants/:id/edit', to: 'restaurants#edit', as: 'edit'
  post 'restaurants/:id/upvote', to: 'restaurants#upvote', as: 'upvote'
  post 'restaurants/:id/downvote', to: 'restaurants#downvote', as: 'downvote'
end
