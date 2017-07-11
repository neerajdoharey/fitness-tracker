class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource
  helper_method :checking_settings , :weight_unit,:length_unit

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def checking_settings
    unless devise_controller?
      if !current_user.init_settings[:profile]
        redirect_to edit_user_profile_path(current_user)
      elsif !current_user.init_settings[:preferences]
        redirect_to edit_preference_path(current_user)
      end
    end
  end

  def bmi_chart(bmi)
    case bmi
    when 0..16
      "Severe Thinness"
    when 16..17
      "Moderate Thinness"
    when 17..18.5
      "Mild Thinness"
    when 18.5..25
      "Normal"
    when 25..30
      "Overweight"
    when 30..35
      "Obese Class I"
    when 35..40
      "Obese Class II"
    when bmi > 40
      "Obese Class III"
    end
  end
  def weight_unit
    units = unit_system
    @weight_unit = units[:weight_type]
  end
  def length_unit
    units = unit_system
    @length_unit = units[:length_type]
  end
  def unit_system
    unit_system = current_user.preference
    return {measure_type: unit_system.measure_type , weight_type: unit_system[:unit_for_measure][:weight], length_type: unit_system[:unit_for_measure][:length] }
  end
end
