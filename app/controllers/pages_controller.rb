class PagesController < ApplicationController
	#before_action :set_user, only: [:show, :edit, :update, :destroy]
	#before_action :is_admin, only: [:index, :show, :destroy, :edit]
	#before_action :is_super, only: [:index, :show, :destroy, :edit]

	def index
	end

	def about
	end

	def new_login
	end

	def process_login
		#destroy current session
		session[:user_info] = nil

		@username = params[:username]
		@password = params[:password]

		#@result = Admin.where(username: @username).where(password: @password).first
		#securing login
		@result = Admin.find_by(username: @username)

		if @result && @result.authenticate(@password) then
			session[:user_info] = @username
			redirect_to "/"
		else 
			redirect_to "/login"
		end
	end

	def logout
		session[:user_info] = nil
		redirect_to "/"
	end

	def is_logged
		if session[:user_info].nil? then
			redirect_to "/login"
		end
	end

	def is_admin
		if session[:user].nil? && session[:user_type] = 'admin' then
			redirect_to "/login"
		end
	end

	def is_super
		if session[:user].nil? && session[:user_type] = 'super' then
			redirect_to "/login"
		end
	end
end
