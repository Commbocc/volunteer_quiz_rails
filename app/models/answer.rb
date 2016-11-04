class Answer < ApplicationRecord
	belongs_to :question, inverse_of: :answers

	has_many :opportunity_weights, inverse_of: :answer, dependent: :destroy, class_name: "AnswerOpportunity"

	accepts_nested_attributes_for :opportunity_weights

	validates :content, presence: true

end
