class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    # @items = Item.all 今はまだ必要でない
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
    params.require(:item).permit(:image, :item_name, :item_description, :item_category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :item_price).merge(user_id: current_user.id)
  end

end