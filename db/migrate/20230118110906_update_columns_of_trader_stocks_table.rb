class UpdateColumnsOfTraderStocksTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :trader_stocks, :portfolio
    remove_reference :trader_stocks, :stock
    add_column :trader_stocks, :symbol, :string
  end
end
