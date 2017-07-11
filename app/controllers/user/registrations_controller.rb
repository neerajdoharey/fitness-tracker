class User::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def create
     super
     resource.build_user_profile(gender: 'Male', date_of_birth: '2017-06-10 15:04:31', address1: "Default1", address2: "Default2")
     resource.build_preference(measure_type: 'Metric',unit_for_measure: {weight: "Kg",length: "Cm"})
     resource.save
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :init_settings])

  end

end
