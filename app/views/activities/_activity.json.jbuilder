json.extract! activity, :id, :title, :image, :activity_date, :address, :max_count, :detail, :apply_start_time, :apply_end_time, :deleted_at, :created_at, :updated_at
json.url activity_url(activity, format: :json)
