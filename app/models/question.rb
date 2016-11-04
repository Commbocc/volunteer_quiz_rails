class Question < ApplicationRecord

	has_many :answers, inverse_of: :question, dependent: :destroy
	accepts_nested_attributes_for :answers, allow_destroy: true

	validates :content, presence: true

end
