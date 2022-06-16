class CreateDerivaries < ActiveRecord::Migration[6.1]
  def change
    create_table :derivaries do |t|

      t.timestamps
    end
  end
end
