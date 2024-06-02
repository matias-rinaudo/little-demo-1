module LineItems
  class Build
    class << self
      def call(current_cart:, product:)
        if current_cart.product_exist?(product)
          line_item = current_cart.line_items.find_by(:product_id => product)
          line_item.add_quantity
        else
          line_item = LineItem.new
          line_item.cart = current_cart
          line_item.product = product
          line_item.quantity = 1
        end

        line_item
      end
    end
  end
end
