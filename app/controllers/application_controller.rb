class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	# before_filter :authenticate
	before_action :share_this

	def share_this
		Struct.new("Sharethis", :name, :css_class)

		@sharethis = []
		@sharethis << Struct::Sharethis.new("Facebook", "st_facebook_large")
		@sharethis << Struct::Sharethis.new("Tweet", "st_twitter_large")
		@sharethis << Struct::Sharethis.new("LinkedIn", "st_linkedin_large")
		@sharethis << Struct::Sharethis.new("Pinterest", "st_pinterest_large")
		@sharethis << Struct::Sharethis.new("Email", "st_email_large")
		@sharethis << Struct::Sharethis.new("ShareThis", "st_sharethis_large")
	end

	protected

	def authenticate
		authenticate_or_request_with_http_basic do |username, password|
			username == ENV["http_basic_username"] && password == ENV["http_basic_password"]
		end
	end

end
