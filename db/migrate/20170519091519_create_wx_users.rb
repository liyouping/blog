class CreateWxUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :wx_users do |t|
      t.string :open_id
      t.string :nick_name
      t.string :tel_num
      t.string :avatar_url
      t.integer :gender
      t.string :province
      t.string :city
      t.string :country
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
