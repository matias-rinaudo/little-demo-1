class ProductsController < ApplicationController 
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.order(title: :desc).page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :price, :description, :stock)
    end
end