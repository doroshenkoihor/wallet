class Spending < ApplicationRecord
  enum category: { traveling: 0, clothing: 1, taxi: 2, cafes: 3, shops: 4, other: 5 }
  belongs_to :user
  validates :category, presence: true
  validates :description, presence: true
  validates :amount, presence: true
end
