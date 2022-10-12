class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :truck, null: false, foreign_key: true
      t.integer :total, default: 0
      t.string :status, default: 'pending'
      t.timestamps
    end
  end
end
