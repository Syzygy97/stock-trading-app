# == Schema Information
#
# Table name: trader_stocks
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
#  index_trader_stocks_on_portfolio_id  (portfolio_id)
#  index_trader_stocks_on_stock_id      (stock_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#  fk_rails_...  (stock_id => stocks.id)
#
require 'rails_helper'

RSpec.describe TraderStock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
