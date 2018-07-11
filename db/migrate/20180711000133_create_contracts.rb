class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.datetime :initialDate
      t.datetime :finalDate

      t.timestamps
    end
  end
end
