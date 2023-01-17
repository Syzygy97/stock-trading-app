class Stock < ApplicationRecord
  has_many :trader_stocks
  has_many :portfolios, through: :trader_stocks
  has_many :histories
  has_many :orders

  validates :company_name, :symbol, :price, :quantity, :logo, presence: true

end
