class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new(item_params)
  end

  def edit
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item)
    else
    render edit
    end
  end

  def update

  end

  private

  def item_params
    params.permit(:name,:infomation,:image,:pice_no_tax)
  end

end
