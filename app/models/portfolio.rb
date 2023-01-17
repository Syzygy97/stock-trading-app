# == Schema Information
#
# Table name: portfolios
#
#  id         :bigint           not null, primary key
#  balance    :decimal(15, 2)   default(0.0)
#  first_name :string
#  last_name  :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Portfolio < ApplicationRecord
  has_many :trader_stocks
  has_many :stocks, through: :trader_stocks
  has_many :orders
  has_many :histories
end
