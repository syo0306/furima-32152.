class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @donation_form = DonationForm.new
    if current_user.id == @item.user_id || @item.donation != nil
      redirect_to root_path
    end
  end


  def create
    @item = Item.find(params[:item_id])
    @donation_form = DonationForm.new(order_params)
    if @donation_form.valid?
      pay_item
      @donation_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:price, :postal_code, :area_id, :city, :house_number, :building, :phone_number, :item_id, :token).marge(:use_id)
  end

  def pay_item
    Payjp.api_key = (process.env.PAYJP_PUBLIC_KEY)
      Payjp::Charge.create(
        amount: @item.item_price,  
        card: order_params[:token], 
        currency: 'jpy'
      )
  end
end