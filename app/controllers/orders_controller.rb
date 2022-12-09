class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]


  def index
    # ログインしたユーザーと出品者が同じかどうかの分岐
    if user_signed_in? && current_user.id != @item.user_id && @item.purchase_record == nil
      @purchase_shipping = PurchaseShipping.new
    else
      redirect_to root_path
    end
  end


  def create
    @purchase_shipping = PurchaseShipping.new(purchase_records_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_records_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.selling_price,  # 商品の値段
      card: purchase_records_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end