class Delivery < ApplicationRecord
belongs_to :customer
  
  def address_all
    '〒' + post_code + ' ' + address + ' ' + name
  end
  
end
