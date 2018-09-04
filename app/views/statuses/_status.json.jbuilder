json.extract! status, :id, :body, :image, :video, :user_id, :created_at, :updated_at
json.url status_url(status, format: :json)
