class Opportunity < ApplicationRecord

	has_many :opportunity_weights, inverse_of: :opportunity, dependent: :destroy, class_name: "AnswerOpportunity"

	validates :name, :link, presence: true
	validates :link, format: URI::regexp(%w(http https))

	def image
		if image_src.present?
			image_src
		else
			'https://placehold.it/725x725.png?text=' + name
		end
	end

end
