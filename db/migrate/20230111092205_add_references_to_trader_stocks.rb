class AddReferencesToTraderStocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :trader_stocks, :portfolio, null: false, foreign_key: true
    add_reference :trader_stocks, :stock, null: false, foreign_key: true
  end
end
