class Item < ApplicationRecord
 
  with_options presence: true do
    validates :list
    validates :detail
    validates :situation
    validates :category
    validates :shipping_charge
    validates :prefecture
    validates :days_to_ship
    validates :selling_price
    validates :image
    validates :category_id, :situation_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 }
    validates :category_id, :situation_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}  
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :situation
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

end
