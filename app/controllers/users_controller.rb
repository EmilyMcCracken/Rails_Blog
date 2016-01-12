class UsersController < ApplicationController
# set variable to show all users on index page
  def index
  	@users = User.all
  	@user = current_user
  end

  def show
 # set variable to find user by user_id
  	@user = User.find(params[:id])
    @posts = @user.posts
    @current_user = User.find(session[:user_id])

  end

  def new
 # set variable to create a new user
  	@user = User.new
  end

  def create
  	puts "***** TESTING CREATING A NEW USER!"
 # set variable to create new user using params set on /new page
  	@user = User.new(user_params)
 # save the user that was created
  	@user.save
  	session[:user_id] = @user.id
 # redirect to the newly create user's profile page /show
  	redirect_to new_profile_path
  end

# created Profiles model and controller so no longer have a need for editing profile information through the User controller

	def destroy
	puts "***** TESTING DELETING USER"
# set variable to find a specific user by user_id
	@user = User.find(params[:id])
# delete user from database upon clicking link in /show
	@user.destroy
# end session so the current_user method stops looking for their id
  session[:user_id] = nil

# redirect to /index 
	redirect_to root_path
	end
# set strong params for security
	private

  def user_params
    params.require(:user).permit(:username, :password, :email, :zipcode)   
	end
 
end
