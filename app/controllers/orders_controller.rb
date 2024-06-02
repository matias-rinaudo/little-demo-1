class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit]

  def index
    @orders = Order.all
  end

  def show;end

  def edit;end

  def update
    ::Orders::Finished

    redirect_to root_path 
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :email, :address)
  end
end