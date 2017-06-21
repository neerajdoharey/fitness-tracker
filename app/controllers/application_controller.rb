class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource
  helper_method :checking_settings

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
end
