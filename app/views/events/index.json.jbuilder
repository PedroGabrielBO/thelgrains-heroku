json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :start, :end, :all_day, :state, :created_at, :user_id, :cliente_id
  # if created_at != updated_at
  #  json.updated_at :updated_at
  # end
  json.url event_url(event, format: :html)
end
