class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_items_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to request.referer
  end

  def destroy_all
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
