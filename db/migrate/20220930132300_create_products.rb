class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.decimal :price
      t.integer :start_quantity
      t.integer :product_type
      t.string  :name

      t.timestamps
    end
  end
end
