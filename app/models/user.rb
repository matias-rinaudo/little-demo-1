class User < ApplicationRecord
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :role, presence: true
  validates :email, format: EMAIL_REGEXP
  validates :password, confirmation: true

  enum role: { admin: 1 }
end
