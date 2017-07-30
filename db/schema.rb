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

ActiveRecord::Schema.define(version: 20170730132307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled"
    t.string "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled"
    t.date "start_date"
    t.date "end_date"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs_actions", force: :cascade do |t|
    t.bigint "jobs_steps_id"
    t.bigint "action_id"
    t.text "return_block"
    t.boolean "enabled"
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_jobs_actions_on_action_id"
    t.index ["jobs_steps_id"], name: "index_jobs_actions_on_jobs_steps_id"
  end

  create_table "jobs_results", force: :cascade do |t|
    t.bigint "job_id"
    t.text "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_jobs_results_on_job_id"
  end

  create_table "jobs_rules", force: :cascade do |t|
    t.bigint "jobs_steps_id"
    t.bigint "rule_id"
    t.text "return_block"
    t.boolean "enabled"
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jobs_steps_id"], name: "index_jobs_rules_on_jobs_steps_id"
    t.index ["rule_id"], name: "index_jobs_rules_on_rule_id"
  end

  create_table "jobs_steps", force: :cascade do |t|
    t.bigint "job_id"
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_jobs_steps_on_job_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled"
    t.string "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "jobs_actions", "actions"
  add_foreign_key "jobs_actions", "jobs_steps", column: "jobs_steps_id"
  add_foreign_key "jobs_results", "jobs"
  add_foreign_key "jobs_rules", "jobs_steps", column: "jobs_steps_id"
  add_foreign_key "jobs_rules", "rules"
end