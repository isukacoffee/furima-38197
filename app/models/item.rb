class Item < ApplicationRecord

   validates :list,                presence: true
   validates :detail,              presence: true
   validates :situation_id,        presence: true
   validates :category_id,         presence: true
   validates :shipping_charge_id,  presence: true
   validates :prefecture_id,       presence: true
   validates :days_to_ship_id,     presence: true
   validates :selling_price,       presence: true

 belongs_to :user
 has_one :purchase_record
 has_one_attached :image

end
