class AddQuantityToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :quantity, :integer
  end
end
