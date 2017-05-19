json.extract! wx_user, :id, :open_id, :nick_name, :avatar_url, :gender, :province, :city, :country, :deleted_at, :created_at, :updated_at
json.url wx_user_url(wx_user, format: :json)
