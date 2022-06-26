class Public::OrdersController < ApplicationController
  
  def new
    @select_addresses = { 0 => "ご自身の住所", 1 => "登録済み住所", 2 => "新しいお届け先" }
    @order = Order.new
  end

  def index
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
    
    if params[:order][:payment_method] == "credit_card"
      @payment_method_display = Order.payment_methods_i18n[:credit_card]
    elsif params[:order][:payment_method] == "transfer"
      @payment_method_display = Order.payment_methods_i18n[:transfer]
    end
    
    @order = Order.find_or_initialize_by(id: params[:id])
    @carts = current_customer.carts
    @order.postage = 800
    @price_all = 0
    
    @carts.each do |cart|
      @price_all +=  cart.item.with_tax_price * cart.quantity
    end
    @order.billing_amount = @price_all + @order.postage
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    
    current_customer.carts.each do |cart|
      order_detail = @order.order_detail.new
      order_detail_id = cart.item_id
      order_detail.quantity = cart.quantity
      order_detail.tax_in_price = cart.item.with_tax_price
      order_detail.save
    end
    redirect_to thx_path

  end

  def thx
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end
  
  def order_details_params
    params.require(:order_details).permit(:quantity, :tax_in_price)
  end  
end
