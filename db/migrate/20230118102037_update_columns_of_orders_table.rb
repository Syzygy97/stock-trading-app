class UpdateColumnsOfOrdersTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :portfolio
    remove_reference :orders, :stock
    add_column :orders, :symbol, :string
  end
end
