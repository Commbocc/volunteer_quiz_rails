class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	# before_filter :authenticate

	protected

	def authenticate
		authenticate_or_request_with_http_basic do |username, password|
			username == ENV["http_basic_username"] && password == ENV["http_basic_password"]
		end
	end

end
