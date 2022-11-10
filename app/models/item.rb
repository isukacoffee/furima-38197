class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
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
  end

  belongs_to :situation
  belongs_to :category
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

end
