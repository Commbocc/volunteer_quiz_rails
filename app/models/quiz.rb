class Quiz

	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :questions

	validate :questions_answered?

	def initialize(attributes = {})
		@form_results = attributes
		# questions = @form_results
	end

	def persisted?
		false
	end

	def answered_questions
		Question.where id: @form_results.map{|k,v| k}
	end

	def answers
		Answer.where id: @form_results.map{|k,v| v}
	end

	def results
		results = {}

		answers.each do |a|
			a.opportunity_weights.each do |ow|
				results[ow.opportunity_id] ||= 0
				results[ow.opportunity_id] += ow.weight
			end
		end

		opp_ids = results.sort_by{ |k,v| v }.reverse.map{ |k,v| k }
		return Opportunity.find(opp_ids).index_by(&:id).values_at(*opp_ids)

	end

	private

	def questions_answered?
		if @form_results.present?
			# if (Question.all - answered_questions).any?
			# 	errors.add(:questions, " must all be answered.")
			# end
		else
			errors.add(:questions, "- At least one question must be answered.")
		end
	end

end
