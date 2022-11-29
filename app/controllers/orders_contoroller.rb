class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
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

    private


  def purchase_record_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id)
  end
end