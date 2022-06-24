class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def show
  end

  def index
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders_path
  end

  def confirm

  end

  def thx

  end
  
  def order_params
    params.require(:order).permit(:post_code, :address, :name, :payment_method)
  end
end
