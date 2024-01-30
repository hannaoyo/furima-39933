class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @order_form = OrderForm.new
  end

  def create
  end
end
