class AnswerOpportunity < ApplicationRecord
	belongs_to :answer, inverse_of: :opportunity_weights
	belongs_to :opportunity, inverse_of: :opportunity_weights
end
