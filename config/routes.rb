Rails.application.routes.draw do
  root 'pages#home'

  #devise_for :students
  devise_for :students, controllers: { omniauth_callbacks: 'students/omniauth_callbacks' }

  resources :students, only: [:show, :index]
  resources :exams, only: [:show, :index]
  resources :student_exams, only: [:create, :destroy]
  resources :projects, only: [:show, :new, :create, :destroy]
  
end
