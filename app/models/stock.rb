class Stock < ApplicationRecord
  # has_many :portfolios, through: :trader_stocks
  # has_many :histories
  # has_many :trader_stocks
  # has_many :orders

  def update_stock_quantity order_quantity
    update(quantity: quantity + order_quantity)
  end

end