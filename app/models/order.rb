class Order < ApplicationRecord
  belongs_to :user
  validates :order_type, :price, :quantity, presence: true
  validates :order_type, inclusion: { in: %w[BUY SELL] }
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  # validate :user_balance_sufficient?
  validate do 
    if !user_balance_sufficient?
      errors.add :balance, "Insufficient User Balance"
    end
  end

  before_save :compute_total_order_price
  # before_save :user_balance_sufficient? 
  # after_save :calculate_user_balance

  private

  def compute_total_order_price
    # debugger
    self.price = quantity * self.price
  end

  def user_balance_sufficient?
    return false if price.nil? || quantity.nil?
    return false if order_type == "BUY" && (user.balance < (price * quantity))
    return true
  end
  # def calculate_user_balance
  #   debugger
  #   if order_type == "BUY"
  #     user.balance = (user.balance - price).to_f
  #   else
  #     user.balance = (user.balance + price).to_f
  #   end
  # end
end
