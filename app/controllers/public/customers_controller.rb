class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def confirmation
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name,
                                    :last_name_kana, :first_name_kana,
                                    :postal_code, :address,
                                    :telephone_number,:email)
  end
end
