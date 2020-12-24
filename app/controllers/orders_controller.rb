class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:index, :create]

  def index
    @donation_form = DonationForm.new
    if current_user.id == @item.user_id || @item.donation != nil
      redirect_to root_path
    end
  end


  def create
    @donation_form = DonationForm.new(order_params)

    if @donation_form.valid?
      @donation_form.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :area_id, :city, :house_number, :building, :phone_number,:donation_id,:item_id,:token).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,  
        card: order_params[:token], 
        currency: 'jpy'
      )
  end
end
