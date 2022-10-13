class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :price, default: 100
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
