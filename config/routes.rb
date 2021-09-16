Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root 'pages#home'

  
  resources :users, only: [:show, :index, :destroy]
  resources :exams
  resources :user_exams, only: [:create, :destroy]
  resources :user_projects, only: [:create, :destroy]
  resources :projects
  get 'upgrade', to: "users#upgrade_student"
  get 'professors', to: "users#index_professors"
  
  resources :conversations do
    resources :messages
  end
end
