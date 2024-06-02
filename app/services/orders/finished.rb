module Orders
  class Finished
    class << self
      def call(current_cart:, order:)
        byebug
        order.add_items(current_cart)
        order.status = :finished
        order.total = current_cart.sub_total
        order.save!
        Cart.destroy(session[:cart_id])
        ##ENVIAR EMAIL AL CUSTOMER
        session[:cart_id] = nil
      end
    end
  end
end
