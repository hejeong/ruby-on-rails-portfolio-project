class AddImageUrlToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :image_url, :string
  end
end
