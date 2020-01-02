Rails.application.routes.draw do

  root to: 'cocktails#index'


  resources :cocktails, only: [:index, :show, :new, :create, :destroy]
  resources :doses, only: [:create, :new]
  resources :doses, only: [:destroy] # delete destroy
end
