# == Schema Information
#
# Table name: stocks
#
#  id           :bigint           not null, primary key
#  company_name :string
#  logo         :string
#  price        :integer
#  quantity     :integer
#  symbol       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Stock < ApplicationRecord
  has_many :trader_stocks
  has_many :portfolios, through: :trader_stocks
  has_many :histories
  has_many :orders

  validates :company_name, :symbol, :price, :quantity, :logo, presence: true

end
