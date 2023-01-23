class UpdateColumnsOfUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :balance, :decimal, :precision => 15, :scale => 2, :default => 0.00
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
