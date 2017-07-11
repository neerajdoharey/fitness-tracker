class PreferenceController < ApplicationController
  def edit
    @user_preference = current_user.preference
  end

  def update
    @user_preference = current_user.preference
    if @user_preference[:measure_type] == "Metric"
      @user_preference[:unit_for_measure][:weight]="Lbs"
      @user_preference[:unit_for_measure][:length]="Inch"
    elsif @user_preference[:measure_type] == "US Customary"
      @user_preference[:unit_for_measure][:weight]="Kg"
      @user_preference[:unit_for_measure][:length]="Cm"
    end
    if @user_preference.update(user_preference_params)
      flash[:success] = "Preferences was Successfully updated..."
      puts @user_preference.inspect
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
