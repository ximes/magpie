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

ActiveRecord::Schema.define(version: 20170805200735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atom_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "atom_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "atom_desc_idx"
  end

  create_table "atoms", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled"
    t.string "class_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
  end

  create_table "configurations", force: :cascade do |t|
    t.string "track_job_results"
    t.string "track_job_status"
    t.string "job_method"
    t.string "preliminary_header_check"
    t.string "job_notification"
    t.string "job_notification_method"
    t.string "configurable_type"
    t.bigint "configurable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["configurable_type", "configurable_id"], name: "index_configurations_on_configurable_type_and_configurable_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled"
    t.date "start_date"
    t.date "end_date"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "customizable"
  end

  create_table "jobs_actions", force: :cascade do |t|
    t.bigint "jobs_steps_id"
    t.text "return_block"
    t.boolean "enabled"
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "atom_id"
    t.index ["atom_id"], name: "index_jobs_actions_on_atom_id"
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
    t.text "return_block"
    t.boolean "enabled"
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "atom_id"
    t.index ["atom_id"], name: "index_jobs_rules_on_atom_id"
    t.index ["jobs_steps_id"], name: "index_jobs_rules_on_jobs_steps_id"
  end

  create_table "jobs_steps", force: :cascade do |t|
    t.bigint "job_id"
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_jobs_steps_on_job_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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

  add_foreign_key "jobs_actions", "jobs_steps", column: "jobs_steps_id"
  add_foreign_key "jobs_results", "jobs"
  add_foreign_key "jobs_rules", "jobs_steps", column: "jobs_steps_id"
end
