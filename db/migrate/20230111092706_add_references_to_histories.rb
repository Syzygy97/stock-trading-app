class AddReferencesToHistories < ActiveRecord::Migration[7.0]
  def change
    add_reference :histories, :stock, null: false, foreign_key: true
    add_reference :histories, :portfolio, null: false, foreign_key: true
  end
end
