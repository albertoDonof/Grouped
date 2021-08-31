Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'pages#home'

  
  resources :users, only: [:show, :index]
  resources :exams
  resources :user_exams, only: [:create, :destroy]
  resources :user_projects, only: [:create, :destroy]
  resources :projects

  
end
