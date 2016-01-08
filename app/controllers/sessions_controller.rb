class SessionsController < ApplicationController

	def new
	end

	def create
		puts "TEST: LOGGING IN *****************"
		 @user = User.where(username: params[:username]).first     
		 if @user and @user.password == params[:password]       
		 session[:user_id] = @user.id
		 redirect_to @user
		 flash[:notice] = "Hey Birder! You're logged in.. cool profile, by the way"
		else
			flash[:notice] = "Well this is hawkward... something went wrong. Please try again!"
			redirect_to login_path
		end
	end

	def destroy
		puts "TEST SIGNING OUT ***************************"
		if current_user
			session[:user_id] = nil
			# session.clear
			flash[:notice] = "You have been logged out.. see ya later, Birder!"
			redirect_to root_path
		end
	end


end
