class CreateTruckProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :truck_products do |t|
      t.references :truck, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :start_quantity
      t.integer :sold

      t.timestamps
    end
  end
end
