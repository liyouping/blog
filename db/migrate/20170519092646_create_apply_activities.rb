class CreateApplyActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :apply_activities do |t|
      t.string :open_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
