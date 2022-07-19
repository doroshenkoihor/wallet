class User < ApplicationRecord
  has_many :spendings
  has_secure_password
  validates :password_digest, presence: true
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ ,
                                              message: 'Invalid e-mail! Please provide a valid e-mail address'}, uniqueness: true
end
