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

ActiveRecord::Schema.define(version: 20141130115607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "faqs", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.integer  "vote_good"
    t.integer  "vote_bad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faqs", ["name"], name: "index_faqs_on_name", using: :btree
  add_index "faqs", ["vote_good"], name: "index_faqs_on_vote_good", using: :btree

  create_table "projects", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "references", force: true do |t|
    t.string   "reference_type"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
  end

  add_index "references", ["project_id"], name: "index_references_on_project_id", using: :btree
  add_index "references", ["reference_type"], name: "index_references_on_reference_type", using: :btree

  create_table "reset_password_codes", force: true do |t|
    t.integer  "user_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reset_password_codes", ["user_id"], name: "index_reset_password_codes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "last_sync"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "email_verified",  default: false
  end

  add_index "users", ["name"], name: "index_users_on_name", using: :btree

end
