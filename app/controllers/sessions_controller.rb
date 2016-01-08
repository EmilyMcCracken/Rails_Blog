class SessionsController < ApplicationController

	def new
	end
# create a new session when the user logs in
	def create
		puts "TEST: LOGGING IN *****************"
		 @user = User.where(username: params[:username]).first     
		 if @user and @user.password == params[:password]
# start a new session if user and password match in the database  
		 session[:user_id] = @user.id
# redirect to the user's profile page
# right now goes to users#show, will eventually go to profiles#show
		 redirect_to @user
# flash notice that their login was successful
		 flash[:notice] = "Hey Birder! You're logged in.. cool profile, by the way"
		else
# if it doesn't work, flash notice that it was wrong and redirect to login again
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
