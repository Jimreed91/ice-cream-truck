class CreateTruckSnackbars < ActiveRecord::Migration[6.1]
  def change
    create_table :truck_snackbars do |t|
      t.references :truck, null: false, foreign_key: true
      t.references :snackbar, null: false, foreign_key: true
      t.integer :quantity_sold, default: 0

      t.timestamps
    end
  end
end
