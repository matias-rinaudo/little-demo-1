class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @products = Product.order(title: :desc).page(params[:page])
  end
end