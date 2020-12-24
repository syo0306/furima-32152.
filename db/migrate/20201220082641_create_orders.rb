class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
     t.integer :area_id,                null: false
     t.string  :postal_code,             null: false
     t.string  :city,                    null: false
     t.string  :house_number,            null: false
     t.string  :building
     t.string  :phone_number,            null: false
     t.references :donation,             null: false,  foreign_key: true
      t.timestamps
    end
  end
end
