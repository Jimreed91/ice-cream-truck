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

ActiveRecord::Schema.define(version: 2022_09_30_132345) do

  create_table "products", force: :cascade do |t|
    t.decimal "price"
    t.integer "start_quantity"
    t.integer "product_type"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "truck_products", force: :cascade do |t|
    t.integer "truck_id", null: false
    t.integer "product_id", null: false
    t.integer "number_sold", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_truck_products_on_product_id"
    t.index ["truck_id"], name: "index_truck_products_on_truck_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.decimal "profit", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "truck_products", "products"
  add_foreign_key "truck_products", "trucks"
end
