class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.integer   :customer_id
      t.string    :post_code
      t.text      :address
      t.string    :name

      t.timestamps
    end
  end
end
