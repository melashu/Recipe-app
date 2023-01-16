Rails.application.routes.draw do
  root 'public_recipes#index'

  get 'general_shopping_lists', to: 'general_shoping_lists#index', as: 'general_shopping'
  get 'public_recipes', to: 'public_recipes#index'
  get 'public_recipes/:id', to: 'public_recipes#show', as:'show_public_recipes'
  


  get 'recipes/index'
  get 'foods/index'

  get "recipe/:recipe_id/ingredient", to: "ingredients#new", as: 'new_ingredient'
  post "recipe/:recipe_id/ingredient", to: "ingredients#create", as: 'create_ingredient'

  delete "recipe/:recipe_id/ingredient/:id", to: "ingredients#destroy", as: "delete_ingredient"


  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        
      }



  resources :recipes, only: [:index, :show, :new, :create, :destroy]

  resources :foods, only: [:index, :show, :new, :create, :destroy]




end
