class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @addresses = current_customer.addresses.where.not(postal_code: nil, name: nil, address: nil)
    @address = Address.new
    @address = current_customer.addresses.new(address_params)
    unless @address.save
      render "error"
    end
    @address_new = Address.new
  end

  def edit
    @address = current_customer.addresses.find(params[:id])
  end

  def update
    @address = current_customer.addresses.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @addresses = current_customer.addresses.where.not(postal_code: nil, name: nil, address: nil)
    @address = Address.find(params[:id])
    @address.destroy
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
