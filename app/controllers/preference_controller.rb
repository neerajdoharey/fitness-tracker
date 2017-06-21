class PreferenceController < ApplicationController
  def edit
    @user_preference = current_user.preference
    puts @user_preference.inspect
  end

  def update
    @user_preference = current_user.preference
    if @user_preference.update(user_preference_params)
      flash[:success] = "Preferences was Successfully updated..."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def user_preference_params
    params.require(:preference).permit(:measure_type,:unit_for_measure)
  end
end
