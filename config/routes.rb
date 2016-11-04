Rails.application.routes.draw do


  resources :answers
  resources :questions
  resources :opportunities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'quiz/results'
  root 'quiz#index'
end
