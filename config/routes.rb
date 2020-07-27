Rails.application.routes.draw do
  get    'password_resets/new'
  get    'password_resets/edit'
  root   'static_pages#home'
  get    '/dmhome',  to: 'static_pages#dmhome'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #URLは /users/1/following や /users/1/followersの形
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :talks,               only: [:show, :create] do
    member do
      post  :memberships, :dmessages
    end
  end
  resources :memberships,          only: :destroy
  resources :dmessages,            only: :destroy
  resources :likes, only: [:create, :destroy]
  resources :categories, only: [] do
    resources :sub_categories, only: :index
  end
end