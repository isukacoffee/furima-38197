class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  
   def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @purchase_shipping = Purchase_shipping.new
  end

  def create
    @purchase_shipping = Purchase_shipping.new(purchase_record_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path
    else
      #updateを失敗すると編集ページへ
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
     @item.destroy
    #  削除後、メイン画面へ
      redirect_to root_path 
     else
      redirect_to root_path
    end
  end


  private

  def purchase_record_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  # def item_params
  #   params.require(:item).permit(:name, :image, :list, :detail, :situation_id, :category_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :selling_price).merge(user_id: current_user.id)
  # end

end



