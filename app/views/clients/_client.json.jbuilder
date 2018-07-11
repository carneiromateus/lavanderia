json.extract! client, :id, :name, :cpf, :cnpj, :phone, :areaCode, :zipCode, :street, :number, :neighborhood, :city, :state, :created_at, :updated_at
json.url client_url(client, format: :json)
