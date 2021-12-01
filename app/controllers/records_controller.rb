class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index]
  before_action :move_to_index1, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @items = Item.includes(:user)
    @record_address = RecordAddress.new
  end

  def new
    @record_address = RecordAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:record_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name,
                                           :telephone_num, :item_id).merge(user_id: current_user.id, token: params[:token], item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
       redirect_to root_path 
    end
  end

  def move_to_index1
    @item = Item.find(params[:item_id])
    if @item.record.present?
      redirect_to root_path
    end
  end
end
