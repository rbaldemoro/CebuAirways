class PagesController < ApplicationController
	def index
	
	end

	def about

	end

	def new_login

	end

	def process_login
		@username = params[:username]
		@pass = params[:pass]

		puts @username
		puts @pass

		@result = User.where(username: @username).where(pass: @pass).first

		if !@result.nil? then
			session[:user_info] = @result
		end

		redirect_to "/"
	end

	def logout
		session[:user_info] = nil

		redirect_to "/"
	end
end
