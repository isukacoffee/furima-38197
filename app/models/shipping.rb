class Shipping < ApplicationRecord

  with_options presence: true do
    validates :post_code
    validates :municipality
    validates :address
    validates :phone_number
    validates :prefecture_id, numericality: { other_than: 1 , message: "Prefecture can't be blank"}
  end

  belongs_to :purchase_record

end
