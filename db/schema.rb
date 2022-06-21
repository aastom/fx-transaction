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

ActiveRecord::Schema[7.0].define(version: 2022_06_21_225735) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "transactions", force: :cascade do |t|
    t.uuid "transaction_id", default: -> { "uuid_generate_v4()" }, null: false
    t.uuid "customer_id", null: false
    t.float "input_amount", null: false
    t.string "input_currency", null: false
    t.float "output_amount", null: false
    t.string "output_currency", null: false
    t.datetime "transaction_date", precision: nil, default: "2022-06-21 21:50:07"
    t.index ["transaction_id"], name: "index_transactions_on_transaction_id", unique: true
  end

end
