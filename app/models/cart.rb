class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def sub_total
    self.line_items.sum(&:total_price)
  end

  def product_exist?(_product)
    self.products.include?(_product)
  end
end
