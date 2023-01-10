class AddCredentialColumnsToPortfolios < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :username, :string
    add_column :portfolios, :first_name, :string
    add_column :portfolios, :last_name, :string
  end
end
