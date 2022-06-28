class Admin::ItemsController < ApplicationController
  def index
    @itempage = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @item.errors.full_messages.each  do| msg |
        pp msg
      end

      @genres = Genre.all
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to admin_item_path(@item)
    else
    @genres = Genre.all
    render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id,:name,:infomation,:image,:price_no_tax,:is_active)
  end

end

