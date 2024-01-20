class ItemsController < ApplicationController
  # ログアウト状態の場合は, ログインページに移動
  # ログアウト状態の場合でも商品詳細が表示されるが, 編集・削除・購入できない
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    #ログイン中ユーザーと出品者と同一であれば、商品情報編集ページに遷移できる処理
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :category_id, :item_status_id, :delivery_charge_id,
                                 :delivery_time_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end
end
