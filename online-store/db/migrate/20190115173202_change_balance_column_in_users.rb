class ChangeBalanceColumnInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :balance, :decimal, default: 0
  end
end
