class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:destroy, :add_quantity, :reduce_quantity]
  before_action :authenticate_user!

  def create
    _product = Product.find(params[:product_id])

    if @current_cart.product_exist?(_product)
      @line_item = @current_cart.line_items.find_by(:product_id => _product)
      @line_item.add_quantity
    else
      @line_item = LineItem.new
      @line_item.cart = @current_cart
      @line_item.product = _product
      @line_item.quantity = 1
    end

    @line_item.save!

    redirect_to cart_path(@current_cart)
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
