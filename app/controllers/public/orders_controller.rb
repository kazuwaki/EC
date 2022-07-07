class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @oder = Order.new
  end

  def completion

  end

  def confirm
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal_price }
    @totals = (@total.to_i) + 800
  end
end
