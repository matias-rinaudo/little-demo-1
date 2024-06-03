class Customer < ApplicationRecord
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :email, format: EMAIL_REGEXP
  validates :password, confirmation: true

  has_many :orders

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
