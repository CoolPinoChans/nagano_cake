class Item < ApplicationRecord
  has_one_attached :image

  def with_price_no_tax
      (price_no_tax * 1.1).floor
  end

end
