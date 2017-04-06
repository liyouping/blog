class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :title
      t.string :img
      t.text :content
      t.datetime :date
      t.string :address
      t.integer :max_count,default: 4
      t.datetime :expiry_date
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
