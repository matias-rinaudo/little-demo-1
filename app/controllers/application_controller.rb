class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart

  # layout :layout_by_resource

  # private

  # def layout_by_resource
  #   if devise_controller? || params[:controller] == 'password_resets'
  #     "devise"
  #   elsif current_user
  #     if current_user.is_full_admin
  #       "administracion"
  #     elsif current_user.is_maestro || current_user.is_pariente || current_user.is_director
  #       "institucion"
  #     else
  #       "permisos"
  #     end
  #   else
  #     "application"
  #   end
  # end

  private
  
  def current_cart
    cart = Cart.find_by(:id => session[:cart_id])
    
    if cart.present?
      @current_cart = cart
    else
      session[:cart_id] = nil
    end

    if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name address phone date_of_birth gender])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name address phone date_of_birth gender])
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end 
end
