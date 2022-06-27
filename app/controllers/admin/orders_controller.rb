class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @sum = 0
    @postage = 800
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.order_status == "payment_finish"
      @order_details.update_all(production_status: "production_waiting")
    end
      redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
