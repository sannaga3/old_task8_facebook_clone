Rails.application.routes.draw do
  resources :users, only: [:new, :show, :edit, :confirm, :destroy] do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end
end
