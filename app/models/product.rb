class Product < ApplicationRecord
  has_many :line_items
  has_many_attached :files
  
  validates :title, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true

  scope :with_stock, -> {where('stock > 1')}
  scope :without_stock, -> {where('stock < 1')}

  after_create :set_default_image

  private

  def set_default_image
    return if self.files.attached?

    self.files.attach(io: File.open("app/assets/images/product_default.png"), filename: "default_image")
  end
end
