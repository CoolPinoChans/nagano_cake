class Item < ApplicationRecord
  has_one_attached :image
  has_many :carts
  has_many :order_details
  belongs_to :genre

  def with_tax_price
      (price_no_tax * 1.1).floor
  end

end
