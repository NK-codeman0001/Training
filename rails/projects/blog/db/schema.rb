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

ActiveRecord::Schema[7.0].define(version: 2023_03_24_114049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "admin", primary_key: "emp_id", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", comment: "User's Full Name"
    t.boolean "active", default: false
    t.text "summary"
    t.string "email", null: false
    t.decimal "spend", precision: 10, scale: 2, comment: "in Thousand INR"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "users_type"
    t.integer "user_id"
    t.index ["name"], name: "index_customers_on_name"
  end

  create_table "customers_xxxes", id: false, force: :cascade do |t|
    t.bigint "xxx_id", null: false
    t.bigint "customer_id", null: false
  end

  create_table "new_tables", primary_key: "email", id: :string, force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.decimal "rate", precision: 5, scale: 2
    t.string "supplier_type", null: false
    t.bigint "supplier_id", null: false
    t.string "name", null: false
    t.boolean "approved", default: false
    t.index ["supplier_type", "supplier_id"], name: "index_products_on_supplier"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "products_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_table", comment: "New Table Comment", force: :cascade do |t|
    t.string "name", null: false, comment: "new comment added"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "example@mail.com"
    t.integer "customer_id"
    t.bigint "users_id"
    t.index ["name"], name: "index_xxxes_on_new_name"
    t.index ["users_id"], name: "index_test_table_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.integer "age"
    t.text "address"
    t.boolean "terms_and_conditions", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "articles"
  add_foreign_key "products", "users"
  add_foreign_key "test_table", "customers"
end
