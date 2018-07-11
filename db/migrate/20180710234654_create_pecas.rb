class CreatePecas < ActiveRecord::Migration[5.1]
  def change
    create_table :pecas do |t|

      t.timestamps
    end
  end
end
