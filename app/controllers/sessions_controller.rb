class SessionsController < ApplicationController

	def new
	end

	def create

		user = User.find(params[:user][:id])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user_path(user)
		else
			render 'sessions/new' #back to login
		end
	end

	def destroy
		reset_session
		redirect_to root_path
	end

end
