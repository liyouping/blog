class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :title
      t.string :sub_title
      t.string :icon
      t.string :tel_num
      t.string :landline
      t.string :show_landline
      t.string :address
      t.text :detail

      t.timestamps
    end
  end
end
