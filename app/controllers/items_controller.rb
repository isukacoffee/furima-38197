class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show]
  
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
      render :edit
    end
  end



  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image, :list, :detail, :situation_id, :category_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :selling_price).merge(user_id: current_user.id)

  end

end



