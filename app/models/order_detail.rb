class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum production_status: { "not_available": 0, "production_waiting": 1, "in_production": 2, "production_finish": 3,}
end
