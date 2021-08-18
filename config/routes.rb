Rails.application.routes.draw do
  root 'pages#home'

  devise_for :students
  resources :students, only: [:show, :index]
  resources :exams, only: [:show, :index]
  resources :student_exams, only: [:create, :destroy]
  resources :projects, only: [:show]
  
end
