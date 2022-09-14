Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    member do
      get 'followings', to: 'users/followings#index'
      get 'followers', to: 'users/followers#index'
      post 'follow', to: 'users/followings#create'
      delete 'unfollow', to: 'users/followings#destroy'
    end
  end
end
