class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @addresses = current_customer.addresses.where.not(post_code: nil, name: nil, address: nil)
    @address = Address.new
    @address = current_customer.addresses.new(address_params)
    @address.save
    redirect_to request.referer
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
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to request.referer
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
