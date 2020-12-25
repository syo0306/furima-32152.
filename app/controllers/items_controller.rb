class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update]
  before_action :set_item, only:[:show, :edit, :update, :destroy]

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
  end

  def edit
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
        render :show
    else
      render :edit
    end
  end

  def destroy
    if current_user.id = @item.user.id
     @item.destroy
     redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :image, :item_price, :category_id, :status_id, :area_id, :item_postage_id, :day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end