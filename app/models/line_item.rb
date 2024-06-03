class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order

  def self.product_most_sale
    product_id = LineItem.includes(:order).where(order: {status: :finished}).group(:product_id).sum(:quantity).max_by{|k,v| v}.first
    Product.find(product_id)
  end
  
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
