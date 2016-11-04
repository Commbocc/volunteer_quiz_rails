class Opportunity < ApplicationRecord
	has_many :opportunity_weights, inverse_of: :opportunity, class_name: "AnswerOpportunity"
end
