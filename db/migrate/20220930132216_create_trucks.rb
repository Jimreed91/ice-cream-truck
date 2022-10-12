class CreateTrucks < ActiveRecord::Migration[6.1]
  def change
    create_table :trucks do |t|
      t.integer :profit, default: 0

      t.timestamps
    end
  end
end
