Rails.application.routes.draw do


	concern :sortable do
		collection do
			post :sort
		end
	end

	resources :quizzes, only: [:new, :create, :show]
	resources :questions, concerns: :sortable
	resources :answers, concerns: :sortable
	resources :opportunities
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get 'admin' => 'questions#index'
	get 'results' => 'quizzes#results'

	root 'quizzes#new'
end
