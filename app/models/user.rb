class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :trader_stocks
         has_many :orders

  def recalculate_balance price#, order_type
    # if order_type == "BUY"
    update(balance: balance + price)
  end
end


