class RemoveUnwantedColumnsOfModels < ActiveRecord::Migration[7.0]
  def change
    remove_column :histories, :stock_id
    remove_column :histories, :buyer_id
    remove_column :orders, :user_id
    remove_column :orders, :stock_id
    remove_column :trader_stocks, :user_id
    remove_column :trader_stocks, :stock_id
  end
end
