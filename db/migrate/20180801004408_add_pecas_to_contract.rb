class AddPecasToContract < ActiveRecord::Migration[5.1]
  def change
  	add_column :pecas, :contract_id, :integer
  end
end
 