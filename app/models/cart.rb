class Cart < ApplicationRecord
  belongs_to :order
  has_many :line_items
  has_many :products, through: :line_items

  def total_items
    self.line_items.sum(&:total_price)
  end

  def sub_total
    total_items 
  end

  def total
    sub_total
  end

  def product_exist?(product)
    self.products.include?(product)
  end
end
