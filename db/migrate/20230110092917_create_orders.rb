class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.bigint :stock_id
      t.string :order_type
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
