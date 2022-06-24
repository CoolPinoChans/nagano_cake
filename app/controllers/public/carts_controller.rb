class Public::CartsController < ApplicationController
  protect_from_forgery
  def index
    @cart_items = current_customer.carts
    @price_all = 0
  end

  def update
    cart_item = Cart.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to carts_path
  end

  def destroy
    cart_item = Cart.find(params[:id])
    cart_item.destroy
    redirect_to carts_path
  end

  def destroy_all

  end

  def create
    @cart_item = Cart.new(cart_item_params)
    @cart_items = current_customer.carts.find_by(item_id: params[:item_id])

    if @cart_items.present?
      new_amount = @cart_items.amount + @cart_item.amount
      @cart_items.update_attribute(:quantity, new_amount)
      @cart_item.delete
      redirect_to carts_path
    else
      @cart_item.save
      redirect_to carts_path
    end
  end

  private
  def cart_item_params
    params.require(:cart).permit(:item_id, :quantity)
  end

end
