class Cart < ApplicationRecord
　belongs_to :customer
  has_many :cart_items,dependent: :destroy
  has_many :items, through: :cart_items
  
  def subtotal
    item.with_tax_price * amount
  end
  
end
