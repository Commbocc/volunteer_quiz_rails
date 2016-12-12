class Opportunity < ApplicationRecord

	has_many :opportunity_weights, inverse_of: :opportunity, dependent: :destroy, class_name: "AnswerOpportunity"

	validates :name, :link, presence: true
	validates :link, format: URI::regexp(%w(http https))

end
