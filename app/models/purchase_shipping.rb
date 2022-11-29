class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality, message: "Municipality can't be blank"
    validates :address, message: "Addresses can't be blank"
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Post code can't be blank" } # 郵便番号（ハイフンあり7桁）
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: "Phone number can't be blank" } # 携帯番号(ハイフンなし10桁or11桁)
    validates :prefecture_id, numericality: { other_than: 1 , message: "Prefecture can't be blank"}
  end
  
  def save
    # 購入テーブル名
     purchase_record = Purchase_record.create(user_id: user_id, item_id: item_id) 
    # 配送先テーブル名
     Shipping.create(post_code: post_code, prefecture: prefecture, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_record_id: purchase_record_id)
  end
end