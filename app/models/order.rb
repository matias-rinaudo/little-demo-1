class Order < ApplicationRecord
  has_one :cart
	has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  belongs_to :customer

  validates :name, :email, :address, presence: true, on: :update

  enum status: { pending: 1, finished: 2 }

  scope :total_amount_finished, -> {where(status: :finished).sum(&:total)}

  before_update :add_items
  after_update :remove_stock_products

  private

  def add_items
    self.cart.line_items.each do |item|
      self.line_items << item
      item.cart_id = nil
      item.save!
    end
  end

  def remove_stock_products
    return if self.pending?

    self.line_items.each do |item|
      product = item.product
      stock_product = product.stock
      quantity_item = item.quantity
      
      product.update!(stock: stock_product - quantity_item)
    end
  end
end
