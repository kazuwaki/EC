class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
  end

  def create
    cart_items = CartItem.all
    order = current_customer.orders.new(order_params)
    if order.save
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = order.id
        order_detail.item_id = cart_item.item_id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.price

        order_detail.save
      end

      cart_items.destroy_all
      redirect_to completion_orders_path
    end
  end

  def completion

  end

  def confirm
    @cart_items = CartItem.all
    @order = current_customer.orders.new(order_params)
    @shipping_cost = 800
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal_price }
    @order.total_payment = (@total.to_i) + (@shipping_cost.to_i)
    @address_select = params[:order][:address_select]
    if @address_select == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif @address_select == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else

    end
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @shipping_cost = 800
    @total = @order.total_payment - @shipping_cost
  end

  private
  def order_params
    params.require(:order).permit(:postal_code,:address, :shipping_cost, :name, :total_payment, :payment_method, :status)
  end
end
