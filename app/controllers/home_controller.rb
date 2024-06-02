class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    debugger
    @products = Product.with_stock.order(title: :desc).page(params[:page])
  end
end