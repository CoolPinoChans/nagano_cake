class Public::OrdersController < ApplicationController
  
  def new
    @select_addresses = { 0 => "ご自身の住所", 1 => "登録済み住所", 2 => "新しいお届け先" }
    @order = Order.new
  end

  def index
  end

  def create
    
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address].to_i == 0
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address].to_i == 1
      address = current_customer.deliveries.find_by(id: params[:order][:delivery_id])
      @order.post_code = address.post_code
      @order.address = address.address
      @order.name = address.name
    elsif params[:order][:select_address].to_i == 2
      @order = params[:post_code, :address, :name]
    end
  end

  def thx

  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end
end
