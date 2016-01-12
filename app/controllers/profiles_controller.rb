class ProfilesController < ApplicationController
  def new
    # set variable for a new profile so the info isn't in the view
    @profile = Profile.new
  end

  def create
    # set variable for a new profile so the info isn't in the view
    @profile = Profile.new(profile_params)
    # set the user to whoever's session is running (current user)
    @user = current_user
    # save the newly created profile
    @profile.save 
    # connect the newly saved profile with the current user
    @user.profile = @profile
    # redirect to the user's profile page
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
         flash[:notice] = "somebirdy updated their profile!"
  end

    private

    def profile_params
    params.require(:profile).permit(:fname, :lname, :favbird, :bio)   
    end
end
