class Admin::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end

  def index
  end
end
