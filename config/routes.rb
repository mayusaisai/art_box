Rails.application.routes.draw do
  root to: "arts#index"
  resources :users, only: [:new, :show, :create] do
     resources :arts
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
