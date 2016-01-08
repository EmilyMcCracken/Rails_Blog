class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @user = current_user
    @profile.save 
    @user.profile = @profile

    redirect_to root_path
  end

  def show
    @user = current_user
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
