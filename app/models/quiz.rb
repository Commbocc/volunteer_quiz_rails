class Quiz

	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	# attr_accessor :questions, :email
	attr_accessor :init, :questions

	# validates :email, presence: true
	validate :questions_answered?

	def initialize(attributes = {}, session = nil)
		attributes.each do |name, value|
			send("#{name}=", value)
		end

		unless session.nil?
			session[:quiz] = self.to_json
		end
	end

	def persisted?
		false
	end

	def answered_questions
		Question.where id: questions.map{|k,v| k}
	end

	def answers
		Answer.where id: questions.map{|k,v| v}
	end

	def results(rid = nil)
		results = {}

		answers.each do |a|
			a.opportunity_weights.each do |ow|
				results[ow.opportunity_id] ||= 0
				results[ow.opportunity_id] += ow.weight
			end
		end

		opp_ids = results.sort_by{ |k,v| v }.reverse.map{ |k,v| (k == rid ? nil : k) }.compact
		return Opportunity.find(opp_ids).index_by(&:id).values_at(*opp_ids)
	end

	private

	def questions_answered?
		if questions.present?
			# if (Question.all - answered_questions).any?
			# 	errors.add(:questions, " must all be answered.")
			# end
		else
			errors.add(:questions, "- At least one question must be answered.")
		end
	end

end
