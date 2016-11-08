Rails.application.routes.draw do


	resources :quizzes, only: [:new, :create, :show]
	resources :answers
	resources :questions
	resources :opportunities
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get 'admin' => 'questions#index'

	root 'quizzes#new'
end
