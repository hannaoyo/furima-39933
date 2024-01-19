class ItemsController < ApplicationController
  #ログインしていないユーザーはログインページに移動
  before_action :authenticate_user!,  except: [:index]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  #def show
  #end


  private


  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :category_id, :item_status_id, :delivery_charge_id, :delivery_time_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

end
