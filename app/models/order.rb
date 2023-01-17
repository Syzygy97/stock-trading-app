# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  order_type   :string
#  price        :decimal(, )
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :bigint           not null
#  stock_id     :bigint           not null
#
# Indexes
#
#  index_orders_on_portfolio_id  (portfolio_id)
#  index_orders_on_stock_id      (stock_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#  fk_rails_...  (stock_id => stocks.id)
#
class Order < ApplicationRecord
  belongs_to :portfolio
  belongs_to :stock

  validates :order_type, :price, :quantity, presence: true
  validates :order_type, inclusion: { in: %w[BUY SELL] }
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

end
