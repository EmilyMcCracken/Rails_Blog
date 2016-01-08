class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    puts "***** TESTING CREATING A NEW PROFILE!"
    @profile = Profile.new(profile_params)
    @profile.save
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @profile = Profile.find(params[:id])
  end

  def edit
  end

  def update
  end

    private

    def profile_params
    params.require(:profile).permit(:fname, :lname, :favbird, :bio)   
  end
end
