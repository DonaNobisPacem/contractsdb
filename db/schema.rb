# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151203104942) do

  create_table "committee_members", force: :cascade do |t|
    t.string   "member_name",  limit: 255
    t.boolean  "leader"
    t.integer  "committee_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "committee_members", ["committee_id"], name: "index_committee_members_on_committee_id", using: :btree

  create_table "committees", force: :cascade do |t|
    t.string   "committee_name",   limit: 255
    t.text     "responsibilities", limit: 65535
    t.integer  "contract_id",      limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "committees", ["contract_id"], name: "index_committees_on_contract_id", using: :btree

  create_table "contract_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "contract_type", limit: 4
    t.text     "objectives",    limit: 65535
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "financial_terms", force: :cascade do |t|
    t.string   "payer",           limit: 255
    t.string   "payee",           limit: 255
    t.decimal  "amount",                      precision: 15, scale: 2
    t.string   "frequency",       limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "escalation_rate",             precision: 15, scale: 2
    t.decimal  "advance",                     precision: 15, scale: 2
    t.decimal  "deposit",                     precision: 15, scale: 2
    t.integer  "contract_id",     limit: 4
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "financial_terms", ["contract_id"], name: "index_financial_terms_on_contract_id", using: :btree

  create_table "parties", force: :cascade do |t|
    t.string   "party_name",  limit: 255
    t.boolean  "external"
    t.integer  "contract_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "parties", ["contract_id"], name: "index_parties_on_contract_id", using: :btree

  create_table "physical_scopes", force: :cascade do |t|
    t.string   "address",         limit: 255
    t.decimal  "land_area",                     precision: 15, scale: 2
    t.text     "boundaries",      limit: 65535
    t.text     "use_of_premises", limit: 65535
    t.integer  "contract_id",     limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
  end

  add_index "physical_scopes", ["contract_id"], name: "index_physical_scopes_on_contract_id", using: :btree

  add_foreign_key "committee_members", "committees"
  add_foreign_key "committees", "contracts"
  add_foreign_key "financial_terms", "contracts"
  add_foreign_key "parties", "contracts"
  add_foreign_key "physical_scopes", "contracts"
end
