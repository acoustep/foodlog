class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	include Pundit
  protect_from_forgery with: :null_session
			
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

	def user_not_authorized
		render json: {}, status: 401
	end
end
