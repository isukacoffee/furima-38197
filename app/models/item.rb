class Item < ApplicationRecord
 
  with_options presence: true do
    validates :list
    validates :detail
    validates :situation
    validates :category
    validates :shipping_charge
    validates :prefecture
    validates :days_to_ship
    validates :selling_price, numericality:{ only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
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
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
