json.extract! request, :id, :is_contract, :observation, :paid, :open, :delivery, :created_at, :updated_at
json.url request_url(request, format: :json)
