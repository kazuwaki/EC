class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order_detail.order.id)
    @order_detail.update(order_detail_params)
    if @order_detail.making_status == "in_production"
      @order_detail.order.update(status: "in_making")
    end
    if @order_details.all? { |order_detail| order_detail.making_status == "production_completed"}
      @order_detail.order.update(status: "preparing_shipping")
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
