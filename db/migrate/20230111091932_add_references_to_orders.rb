class AddReferencesToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :portfolio, null: false, foreign_key: true
    add_reference :orders, :stock, null: false, foreign_key: true
  end
end
