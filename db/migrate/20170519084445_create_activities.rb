class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :open_id
      t.string :title
      t.string :image
      t.datetime :activity_date
      t.string :address
      t.integer :max_count
      t.text :detail
      t.datetime :apply_start_time
      t.datetime :apply_end_time
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
