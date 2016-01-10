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
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @user = current_user
    if @profile != nil
      if current_user.id == @profile.user_id
         @profile.update(profile_params)
         redirect_to user_path @user
         flash[:notice] = "Profile Updated!"
      else
        redirect_to user_path @user
        flash[:alert] = "Nice Try Buddy. Not your profile."
      end
    else
        redirect_to new_profile_path
    end  
  end

    private

    def profile_params
    params.require(:profile).permit(:fname, :lname, :favbird, :bio)   
  end
end
