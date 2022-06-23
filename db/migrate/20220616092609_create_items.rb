class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer   :genre_id
      t.string    :name
      t.text      :infomation
      t.integer   :price_no_tax
      t.boolean   :is_active, default: true

      t.timestamps
    end
  end
end
