class AddAndUpdateColumnsToStocks < ActiveRecord::Migration[7.0]
  def change
    add_column :stocks, :symbol, :string
    add_column :stocks, :logo, :string
    rename_column :stocks, :name, :company_name
  end
end
