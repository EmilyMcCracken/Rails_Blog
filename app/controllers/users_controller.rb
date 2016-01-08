class UsersController < ApplicationController
# set variable to show all users on index page
  def index
  	@users = User.all
  end

  def show
 # set variable to find user by user_id
  	@user = User.find(params[:id])
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
 # redirect to the newly create user's profile page /show
  	redirect_to user_path @user
  end

# created Profiles model and controller so no longer have a need for editing profile information through the User controller
#   def edit
#  # set the variable to find a specific user by user_id
#   	@user = User.find(params[:id])
#   end

#   def update
#   	puts "******** TEST UPDATING USER"
#  # set variable to find a specific user by user_id
# 	@user = User.find(params[:id])
# # update user info using attributes passed through update function
# 	@user.update_attributes(params[:user])
# # redirect to newly updated user's profile page  
# 	redirect_to user_path @user
# 	end

	def destroy
	puts "***** TESTING DELETING USER"
# set variable to find a specific user by user_id
	@user = User.find(params[:id])
# delete user from database upon clicking link in /show
	@user.destroy
# redirect to /index 
	redirect_to root_path
	end
# set strong params for security
	private

    def user_params
    params.require(:user).permit(:username, :password, :email, :zipcode)   
	end

end
