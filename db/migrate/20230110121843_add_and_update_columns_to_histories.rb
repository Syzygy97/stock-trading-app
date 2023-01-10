class AddAndUpdateColumnsToHistories < ActiveRecord::Migration[7.0]
  def change
    remove_column :histories, :transaction_type, :string 
    add_column :histories, :stock_id, :bigint
    add_column :histories, :buyer_id, :bigint
    add_column :histories, :price, :decimal
    add_column :histories, :quantity, :integer
  end
end
