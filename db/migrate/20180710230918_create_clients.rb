class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cpf
      t.string :cnpj
      t.string :phone
      t.string :areaCode
      t.string :zipCode
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
