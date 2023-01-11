class CreateTraderStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :trader_stocks do |t|
      t.bigint :user_id
      t.bigint :stock_id
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
