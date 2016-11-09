class QuizzesController < ApplicationController
	# before_action :set_quiz, only: [:show, :edit, :update, :destroy]

	# GET /quizzes/new
	def new
		@quiz = Quiz.new
	end

	# POST /quizzes
	# POST /quizzes.json
	def create
		@quiz = Quiz.new(params[:questions])

		if @quiz.valid?
			render :show
		else
			render :new
		end
	end

	def show
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_quiz
		# @quiz = Quiz.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def quiz_params
		params.fetch(:quiz, {})
		# params.require(:quiz).permit(:questions)
	end
end
