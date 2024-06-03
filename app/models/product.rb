class Product < ApplicationRecord
  has_many :line_items
  has_many_attached :files
  
  validates :title, :stock, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
  
  scope :with_stock, -> {where('stock > 1')}
  scope :without_stock, -> {where('stock < 1')}

  after_create :set_default_image

  def self.most_sale
    id = LineItem.includes(:order).where(order: {status: :finished}).group(:product_id).sum(:quantity).max_by{|k,v| v}.first
    Product.find(id)
  end

  private

  def set_default_image
    return if self.files.attached?

    self.files.attach(io: File.open("app/assets/images/product_default.png"), filename: "default_image")
  end
end
