class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if current_user.id
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :image, :item_price, :category_id, :status_id, :area_id, :item_postage_id, :day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :edit
    end
  end
end
