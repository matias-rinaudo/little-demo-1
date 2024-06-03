class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:destroy, :add_quantity, :reduce_quantity]
  before_action :authenticate_customer!

  def create
    @line_item = ::LineItems::Build.call(current_cart: @current_cart, product: Product.find(params[:product_id]))
    @line_item.save!

    redirect_to root_path, notice: 'Producto agregado al carrito'
  end

  def destroy
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @line_item.add_quantity
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    return @line_item.destroy if @line_item.quantity == 1

    @line_item.reduce_quantity
    @line_item.save

    redirect_to cart_path(@current_cart)
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end
end
