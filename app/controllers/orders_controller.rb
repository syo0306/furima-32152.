class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @donation_form = DonationForm.new
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
    params.permit(:price, :postal_code, :area_id, :city, :house_number, :building, :phone_number, :item_id, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_a7aae1e74182705998cb6914" 
      Payjp::Charge.create(
        amount: @item.item_price,  
        card: order_params[:token], 
        currency: 'jpy'
      )
  end
end