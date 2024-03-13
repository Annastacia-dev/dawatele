class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  before_action :configure_permitted_params, if: :devise_controller?

  private

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_number terms_and_conditions_and_privacy_policy])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name phone_number])
  end

  def authenticate_admin!
    redirect_to request.referrer || root_path, alert: 'You are not authorized to perform this action' unless current_user&.admin?
  end
end
