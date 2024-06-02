class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart

  #layout :layout_by_resource

  private

  def layout_by_resource
    return 'admin_home' if current_user.admin?

    'home'  
   end
  
  def current_cart
    cart = Cart.find_by(:id => session[:cart_id])
    
    if cart.present?
      @current_cart = cart
    else
      session[:cart_id] = nil
    end

    if session[:cart_id] == nil
      @current_cart = Cart.new
      @order = Order.create!(status: :pending)
      @current_cart.order = @order
      @current_cart.save!
      session[:cart_id] = @current_cart.id
    end
  end

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
