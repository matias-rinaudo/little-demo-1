class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_customer!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart, if: :authenticate_customer!

  private
  
  def current_cart
    cart = Cart.find_by(:id => session[:cart_id])
    
    if cart.present?
      @current_cart = cart
    else
      session[:cart_id] = nil
    end

    if session[:cart_id] == nil
      @current_cart = Cart.new
      @order = Order.create!(status: :pending, customer: current_customer)
      @current_cart.order = @order
      @current_cart.save!
      session[:cart_id] = @current_cart.id
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end 
end
