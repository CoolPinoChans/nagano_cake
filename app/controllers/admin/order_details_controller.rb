class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order_detail.production_status == "in_production"
      @order.update(order_status: "production")
    elsif @order_detail.production_status == "production_finish"
      @order.update(order_status: "ready_delivery")
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
