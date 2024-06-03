class Cart < ApplicationRecord
  belongs_to :order
  has_many :line_items
  has_many :products, through: :line_items

  def total_items
    self.line_items.sum(&:total_price)
  end

  def sub_total
    ##ESTO LO HICE ASI PORQUE PODRIAMOS SUMAR EN SUBTOTAL LAS COMISIONES, ENVIO, ETC
    total_items 
  end

  def total
    sub_total
  end

  def product_exist?(product)
    self.products.include?(product)
  end
end
