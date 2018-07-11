class AddDetaisToPeca < ActiveRecord::Migration[5.1]
  def change
    add_column :pecas, :name, :string
    add_column :pecas, :value, :float
    add_column :pecas, :active, :boolean
  end
end
