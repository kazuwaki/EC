class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :oder
end
