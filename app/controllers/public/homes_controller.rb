class Public::HomesController < ApplicationController

  def top
    @items = Item.all.order(created_at: :desc)
    @items = Item.page(params[:page]).per(4)
  end

  def about
  end

end
