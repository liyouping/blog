class CreateActivityTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_types do |t|
      t.string :name
      t.string :image
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
