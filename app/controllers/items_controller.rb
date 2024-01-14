class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render :index, status: :unprocessable_entity
  end


  private


  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :price).merge(user_id: current_user.id)
  end

end
