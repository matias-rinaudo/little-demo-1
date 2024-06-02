class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true

  scope :with_stock, -> {where('stock > 1')}
  scope :without_stock, -> {where('stock < 1')}
end
