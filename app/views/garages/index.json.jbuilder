json.array!(@garages) do |garage|
  json.extract! garage, :id
  json.url garage_url(garage, format: :json)
end
