class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @shipping_cost = 800
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "payment_confirmation"
      @order.order_details.each do |order_detail|
        order_detail.update(making_status: "waiting_for_production")
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
