class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update]

  def edit;end

  def update
    if @order.update(order_params.merge(total: @current_cart.total, status: :finished))
      @current_cart.destroy
      session[:cart_id] = nil
      redirect_to root_path, notice: 'Compra efectuada.'
    else
      redirect_to edit_order_path(@order), notice: 'Revise los campos.'
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :email, :address)
  end
end