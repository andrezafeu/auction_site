Rails.application.routes.draw do
  devise_for :users

  resources :products, only: [:index, :new, :create, :show] do
    resources :bids, only: [:create, :new]
  end
end