Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end
end
