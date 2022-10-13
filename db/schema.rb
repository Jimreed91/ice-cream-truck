# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_221_004_042_225) do
  create_table 'order_products', force: :cascade do |t|
    t.integer 'order_id', null: false
    t.integer 'product_id', null: false
    t.integer 'quantity', default: 0
    t.integer 'unit_price', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['order_id'], name: 'index_order_products_on_order_id'
    t.index ['product_id'], name: 'index_order_products_on_product_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'truck_id', null: false
    t.integer 'total', default: 0
    t.string 'status', default: 'pending'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['truck_id'], name: 'index_orders_on_truck_id'
  end

  create_table 'products', force: :cascade do |t|
    t.integer 'price', default: 100
    t.string 'type'
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'truck_products', force: :cascade do |t|
    t.integer 'truck_id', null: false
    t.integer 'product_id', null: false
    t.integer 'start_quantity', default: 0
    t.integer 'sold', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['product_id'], name: 'index_truck_products_on_product_id'
    t.index ['truck_id'], name: 'index_truck_products_on_truck_id'
  end

  create_table 'trucks', force: :cascade do |t|
    t.integer 'profit', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'order_products', 'orders'
  add_foreign_key 'order_products', 'products'
  add_foreign_key 'orders', 'trucks'
  add_foreign_key 'truck_products', 'products'
  add_foreign_key 'truck_products', 'trucks'
end
