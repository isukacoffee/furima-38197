class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item, foreign_key: :item_id, dependent: :destroy
  has_one :shipping
end
