class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    puts "***** TESTING CREATING A NEW PROFILE!"
 # set variable to create new user using params set on /new page
    @profile = Profile.new(profile_params)
 # save the user that was created
    @profile.save
 # redirect to the newly create user's profile page /show
    redirect_to 
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
  end

  def edit
  end

  def update
  end
end
