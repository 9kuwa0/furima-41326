class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :item_price).merge(user_id: current_user.id)
  end

end