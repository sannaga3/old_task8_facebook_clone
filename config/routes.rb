Rails.application.routes.draw do
  resources :users, only: [:new, :show, :edit, :confirm, :destroy]
end
