class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.text :text
      t.integer :item_price,        null: false
      t.integer :category_id,       null: false
      t.integer :status_id,         null: false
      t.integer :item_postage_id,   null: false
      t.integer :area_id,           null: false
      t.integer :day_id,            null: false
      t.references :user,           foreign_key: true

      t.timestamps
    end
  end
end
