class QuizzesController < ApplicationController

	# before_action :set_quiz, only: [:show, :edit, :update, :destroy]

	# GET /quizzes/new
	def new
		@quiz = Quiz.new
	end

	# POST /quizzes
	# POST /quizzes.json
	def create
		@quiz = Quiz.new(quiz_params, session)

		if @quiz.valid?
			redirect_to @quiz.results.first
		else
			render :new
		end
	end

	def show
	end

	def results
		results = Base64.decode64 params[:q]
		q_results = JSON.parse(results).map{ |q, a| {Question.find(q).content => Answer.find(a).content} }
		render json: JSON.pretty_generate(q_results)
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_quiz
		# @quiz = Quiz.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def quiz_params
		params.require(:quiz).permit(questions: Question.all.map{ |q| q.id.to_s })
	end
end
