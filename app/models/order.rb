class Order < ApplicationRecord
  belongs_to :portfolio
  belongs_to :stock

  validates :order_type, :price, :quantity, presence: true
  validates :order_type, inclusion: { in: %w[BUY SELL] }
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

end
