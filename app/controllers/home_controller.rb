class HomeController < ApplicationController
  skip_before_action :authenticate_customer!
  
  def index
    @products = Product.with_stock.order(title: :desc).page(params[:page])
  end
end
