class RecordsController < ApplicationController
  before_action :set_item, only: [:index, :new, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]

  end

  def new
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
    pay_item
     @record_address.save
      redirect_to root_path
    else
       gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
       render :index, status: :unprocessable_entity
    end
  end


  private

  def record_params
    params.permit(:post_code, :prefecture_id, :municipality, :building, :block, :phone_num).merge(token: params[:token], item_price: @item.item_price, user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: record_params[:token],
      currency: "jpy"
    )
  end