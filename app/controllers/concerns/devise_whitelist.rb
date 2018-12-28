module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitter_parameters, if: :devise_controller?
  end

  def configure_permitter_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:airline_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:airline_name])
  end

end
