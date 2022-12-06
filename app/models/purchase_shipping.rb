class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address 
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" } # 郵便番号（ハイフンあり7桁）
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid. Input only number" } # 携帯番号(ハイフンなし10桁or11桁)
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  end
  
  def save
    # 購入情報テーブル名（外部キー）
     purchase_records = PurchaseRecord.create(user_id: user_id, item_id: item_id) 
    # 配送先テーブル名（配送先テーブル名の中のカラム名）
     Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number)
  end
end