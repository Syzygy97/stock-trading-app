# == Schema Information
#
# Table name: histories
#
#  id           :bigint           not null, primary key
#  price        :decimal(, )
#  quantity     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  portfolio_id :bigint           not null
#  stock_id     :bigint           not null
#
# Indexes
#
#  index_histories_on_portfolio_id  (portfolio_id)
#  index_histories_on_stock_id      (stock_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#  fk_rails_...  (stock_id => stocks.id)
#
class History < ApplicationRecord
  belongs_to :stock
  belongs_to :portfolio
end
