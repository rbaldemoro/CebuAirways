class ApplicationController < ActionController::Base

	def check_login
		if session[:user_info].nil? then
			redirect_to "/"
		end
	end

end
