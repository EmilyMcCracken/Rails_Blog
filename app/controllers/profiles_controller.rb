class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @user = current_user
    @profile.save 
    @user.profile = @profile

    redirect_to @user
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @user = current_user
    current_user.id == @profile.user_id
         @profile.update(profile_params)
         redirect_to user_path @user
         flash[:notice] = "Profile Updated!"
  end

    private

    def profile_params
    params.require(:profile).permit(:fname, :lname, :favbird, :bio)   
  end
end
