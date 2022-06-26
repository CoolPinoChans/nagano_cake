class Admin::HomesController < ApplicationController
  def top
    @orders = Orders.page(params[:page]).per(10)
  end
end
