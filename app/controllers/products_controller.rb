class ProductsController < ApplicationController 
  skip_before_action :authenticate_user!

  def index
    @products = Product.order(title: :desc).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end
end