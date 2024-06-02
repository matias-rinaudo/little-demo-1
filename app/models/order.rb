class Order < ApplicationRecord
	has_many :line_items, dependent: :destroy

  def add_items(cart)
    cart.line_items.each do |item|
      self.line_items << item
      item.cart_id = nil
    end
  end
end
