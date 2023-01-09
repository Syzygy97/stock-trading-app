class AddDefaultAndChangeDataTypeForBalance < ActiveRecord::Migration[7.0]
  def change
    change_column :portfolios, :balance, :decimal, :precision => 15, :scale => 2, :default => 0.00
  end
end
