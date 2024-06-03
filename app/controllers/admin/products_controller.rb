module Admin
  class ProductsController < Admin::ApplicationController 
    before_action :set_product, only: %i[show edit update destroy]

    def index
      @products = Product.order(title: :desc).page(params[:page])
    end

    def show;end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path, notice: 'Producto creado.'
      else
        redirect_to new_admin_product_path, notice: @product.errors
      end
    end

    def edit;end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, notice: 'Producto actualizado.'
      else
        redirect_to new_admin_product_path, notice: @product.errors
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path
    end

    private
    
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :price, :description, :stock, :files => [])
    end
  end
end
