json.extract! user, :id, :open_id, :name, :tel_num, :sex, :created_at, :updated_at
json.url user_url(user, format: :json)
