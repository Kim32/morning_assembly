json.array!(@messages) do |message|
  json.extract! message, :id, :content, :division_cd, :attached_file_id
  json.url message_url(message, format: :json)
end
