class Opportunity < ApplicationRecord

	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :opportunity_weights, inverse_of: :opportunity, dependent: :destroy, class_name: "AnswerOpportunity"

	validates :name, presence: true
	# validates :link, format: URI::regexp(%w(http https))

	default_scope { order(:name) }

	def has_link?
		link.present?
	end

	def has_image?
		image_src.present?
	end

	def image
		if has_image?
			image_src
		else
			'https://placehold.it/720x405.png?text=' + name
		end
	end

	def blurb_html
		if blurb.present?
			Kramdown::Document.new(blurb).to_html.html_safe
		else
			"<p class=\"text-muted\">Check back soon for information on volunteering with #{name}.</p>".html_safe
		end
	end

end
