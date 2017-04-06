class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :open_id
      t.string :name
      t.string :tel_num
      t.string :sex
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
