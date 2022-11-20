class ItemsController < ApplicationController
 
   def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
   @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :list, :detail, :situation_id, :category_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :selling_price).merge(user_id: current_user.id)

  end
end

