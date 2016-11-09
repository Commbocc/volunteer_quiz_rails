class Answer < ApplicationRecord
	belongs_to :question, inverse_of: :answers

	has_many :opportunity_weights, inverse_of: :answer, dependent: :destroy, class_name: "AnswerOpportunity"

	accepts_nested_attributes_for :opportunity_weights

	validates :content, presence: true

	after_initialize :init_weights

	default_scope { order :position }

	private

	def init_weights
		unless opportunity_weights.any?
			Opportunity.all.each do |opp|
				opportunity_weights.find_or_initialize_by(opportunity_id: opp.id)
			end
		end
	end

end
