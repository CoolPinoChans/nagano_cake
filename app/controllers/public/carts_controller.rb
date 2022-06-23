class Public::CartsController < ApplicationController
  def index
    @cart_item = current_customer.cart_items
    @price_all = 0
  end

  def update
  end

  def destroy

  end

  def destroy_all

  end
  
  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_items = current_customer.cart_items.find_by(item_id: params[:item_id])
    
    if @cart_items.present?
      new_amount = @cart_items.amount + @cart_item.amount
      @cart_items.update_attribute(:quantity, new_amount)
      @cart_item.delete
      redirect_to '/carts'
    else
      @cart_item.save
      redirect_to '/carts'
    end
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
  
end
