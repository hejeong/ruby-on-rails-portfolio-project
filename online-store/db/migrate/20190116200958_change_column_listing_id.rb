class ChangeColumnListingId < ActiveRecord::Migration[5.2]
  def change
    rename_column :transactions, :listing_id, :item_id
  end
end
