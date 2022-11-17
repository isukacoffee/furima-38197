require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の出品" do
    context "全ての情報が正しく入力されていれば商品の出品ができる場合" do
      it "image、list、detail、category_id、situation_id、shipping_charge_id、prefecture_id、days_to_ship_id、selling_priceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end
    it '画像が空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "listが空だと出品できない" do
      @item.list = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "List can't be blank"
    end
    it "detailが空だと出品できない" do
      @item.detail = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Detail can't be blank"
    end
    it "category_idが1以外でないと出品できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it "situation_idが1以外でないと出品できない" do
      @item.situation_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Situation can't be blank"
    end
    it "shipping_charge_idが1以外でないと出品できない" do
      @item.shipping_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
    end 
    it "prefecture_idが1以外でないと出品できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it " days_to_ship_idが1以外でないと出品できない" do
      @item. days_to_ship_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Days to ship can't be blank"
    end
    it "selling_priceが空だと出品できない" do
      @item.selling_price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank")
    end
    it "selling_priceが¥300未満だと出品できない" do
      @item.selling_price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
    end
    it "selling_priceが¥9999999以上だと出品できない" do
      @item.selling_price = "10000000002"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
    end
    it "selling_priceが全角数字では出品できない" do
      @item.selling_price = "１００００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not a number")
    end
    it "selling_priceが半角英字では出品できない" do
      @item.selling_price = "sample"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not a number")
    end
    it "selling_priceが半角英数字混合では出品できない" do
      @item.selling_price = "sample1000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not a number")
    end
    it "userが紐付いていないと出品できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
