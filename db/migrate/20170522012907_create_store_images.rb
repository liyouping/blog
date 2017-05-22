class CreateStoreImages < ActiveRecord::Migration[5.0]
  def change
    create_table :store_images do |t|
      t.integer :store_id
      t.string :img_url
      t.integer :position

      t.timestamps
    end
  end
end
