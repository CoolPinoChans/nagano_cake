class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!


  def show
    @customer = current_customer
  end

  def edit
     @customer = current_customer
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
      redirect_to customers_information_path
  end

  def unsubscribe
    @customer = current_customer
     @customer.update(is_deleted: true)
     reset_session
     redirect_to root_path
  end



  private


  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:address,:post_code,:phone_number,:is_deleted)
  end

end
