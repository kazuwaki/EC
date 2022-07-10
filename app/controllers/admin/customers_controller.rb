class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer.update(customer_params)
    redirect_to admin_customers_path(@customer)
  end

  def order_index
    @customer = Customer.find(params[:id])
    @orders = Order.where(customer_id: @customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                    :postal_code, :address, :telephone_number)
  end
end
