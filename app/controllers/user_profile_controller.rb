class UserProfileController < ApplicationController
  def edit
    @user_profile = current_user.user_profile
  end

  def update
    @user_profile = current_user.user_profile
    if @user_profile.update(user_profile_params)
      flash[:success] = "Profile was Successfully updated..."
      # current_user.init_settings[:profile]=true
      # current_user.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def user_profile_params
    params.require(:user_profile).permit(:gender,:date_of_birth, :address1, :address2)
  end
end
