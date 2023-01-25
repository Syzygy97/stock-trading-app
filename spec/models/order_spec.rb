require 'rails_helper'

RSpec.describe Order, type: :model do
  context "when a user buys or sells stocks" do
    it "is not allowed without user_id" do
      order = described_class.new(user_id: nil, symbol: 'TSLA', price: 100, quantity: 20, order_type: "BUY")
      expect(order).not_to be_valid
    end
    it "is not allowed without symbol" do
      order = described_class.new(user_id: 1, symbol: nil, price: 100, quantity: 20, order_type: "BUY")
      expect(order).not_to be_valid
    end
    it "is not allowed without price" do
      order = described_class.new(user_id: 1, symbol: 'TSLA', price: nil, quantity: 20, order_type: "BUY")
      expect(order).not_to be_valid
    end
    it "is not allowed without quantity" do
      order = described_class.new(user_id: 1, symbol: 'TSLA', price: 100, quantity: nil, order_type: "SELL")
      expect(order).not_to be_valid
    end
  end

  # context "when user sell stocks" do
  #   it "is not allowed if user has insufficient balance" do
  #     order = described_class.new(user_id: 1, symbol: 'TSLA', price: 100, quantity: nil, order_type: "SELL")
  #     user = User.new(id: 1, balance: 1000)
      
  #   end
  # end
end
