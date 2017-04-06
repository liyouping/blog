json.extract! activity, :id, :title, :content, :date, :address, :max_count, :expiry_date, :created_at, :updated_at
json.url activity_url(activity, format: :json)
