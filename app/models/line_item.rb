class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order, optional: true

  def total_price
    self.quantity * self.product.price
  end

  def add_quantity
    self.quantity += 1
  end

  def reduce_quantity
    self.quantity -= 1
  end
end
