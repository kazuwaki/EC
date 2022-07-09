class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal_price }
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_items_params)
    @old_cart_item = CartItem.find_by(item: @cart_item.item)
    if @old_cart_item.present? && @cart_item.valid?
      @cart_item.amount += @old_cart_item.amount
      @old_cart_item.destroy
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referer
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to request.referer
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
