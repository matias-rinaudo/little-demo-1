module Admin
  class OrdersController < Admin::ApplicationController 
    before_action :set_order, only: %i[show]

    def index
      @orders = Order.finished.order(created_at: :asc).page(params[:page])
    end

    def show
      respond_to do |format|
        format.html
        format.pdf do
          service_pdf = ::Orders::GeneratePdf.new(order: @order)
          send_data(service_pdf.generate_pdf, filename: "#{@order.id}/#{@order.created_at}.pdf", type: 'application/pdf', :disposition => 'inline')
        end
      end
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end
  end
end
