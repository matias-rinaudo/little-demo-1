module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name role])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name role])
    end

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end 
  end
end
