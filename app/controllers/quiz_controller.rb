class QuizController < ApplicationController
	def index
	end

	def results
		answer_ids = params[:questions].map{ |k,v| v }
		@answers = Answer.where(id: answer_ids)
		results = {}

		@answers.each do |a|
			a.opportunity_weights.each do |ow|
				results[ow.opportunity_id] ||= 0
				results[ow.opportunity_id] += ow.weight
			end
		end

		@results = results.sort_by{ |k,v| v }.reverse.map do |k,v|
			Opportunity.find(k).name
		end.take(3)

	end
	
end
