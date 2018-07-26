class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.boolean :is_contract
      t.string :observation
      t.boolean :paid
      t.boolean :open
      t.datetime :delivery

      t.timestamps
    end
  end
end
