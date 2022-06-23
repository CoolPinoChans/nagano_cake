class Public::CustomersController < ApplicationController


  def show
    @customer = current_customer
  end

  def edit
     @customer = current_customer
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      redirect_to request.referer
    end
  end

  def unsubscribe

  end



  private


  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:full_name_kana,:email,:address,:post_code,:phone_number)
  end

end
