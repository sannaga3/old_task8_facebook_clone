Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :destroy] do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end
end
