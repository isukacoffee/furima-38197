class Orderform
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token