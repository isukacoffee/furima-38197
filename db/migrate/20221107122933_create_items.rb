class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string          :list,                 null: false
      t.text            :detail,               null: false
      t.integer         :situation_id,         null: false
      t.integer         :category_id,          null: false
      t.references      :user,                 null: false, foreign_key: true
      t.integer         :shipping_charge_id,   null: false
      t.integer         :prefecture_id,        null: false
      t.integer         :days_to_ship_id,      null: false
      t.integer         :selling_price,        null: false 
      t.timestamps
    end
  end
end
