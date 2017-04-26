class Answer < ApplicationRecord

	belongs_to :question, inverse_of: :answers
	has_many :opportunity_weights, inverse_of: :answer, dependent: :destroy, class_name: "AnswerOpportunity"
	accepts_nested_attributes_for :opportunity_weights

	validates :content, presence: true

	after_initialize :init_weights

	default_scope { includes(:opportunity_weights).order(:position) }

	private

	def init_weights
		Opportunity.all.each do |opp|
			AnswerOpportunity.find_or_create_by(answer_id: id, opportunity_id: opp.id)
		end
	end

end
