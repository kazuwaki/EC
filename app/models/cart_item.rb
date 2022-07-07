class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer


  def text_price
    (price*1.1).floor
  end

  def subtotal_price
    (item.text_price*amount)
  end


end
