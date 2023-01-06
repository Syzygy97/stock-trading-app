class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.string :transaction_type

      t.timestamps
    end
  end
end
