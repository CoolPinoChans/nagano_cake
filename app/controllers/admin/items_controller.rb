class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item)
    else
    render new
    end
  end

  def update

  end

  private

  def item_params
    params.require(:item).permit(:name,:infomation,:image,:price_no_tax,:is_active)
  end

end
