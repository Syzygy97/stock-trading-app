class AddColumnsForChangeAndChangePercentToStocksTable < ActiveRecord::Migration[7.0]
  def change
    add_column :stocks, :change, :float
    add_column :stocks, :percent_change, :string
  end
end
