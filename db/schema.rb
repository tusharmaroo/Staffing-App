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

ActiveRecord::Schema.define(version: 20140623123339) do

  create_table "assignments", force: true do |t|
    t.boolean  "billable"
    t.integer  "group_id"
    t.integer  "project_id"
    t.integer  "person_id"
    t.integer  "allocation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "startdate"
    t.datetime "enddate"
  end

  add_index "assignments", ["group_id"], name: "index_assignments_on_group_id"
  add_index "assignments", ["person_id"], name: "index_assignments_on_person_id"
  add_index "assignments", ["project_id"], name: "index_assignments_on_project_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.text     "skills"
    t.float    "totalExp"
    t.float    "tcsExp"
    t.float    "relExp"
    t.string   "mobilenumber"
    t.string   "emailid"
    t.integer  "allocation"
    t.text     "interestAreas"
    t.boolean  "active", default: true
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
  end

  add_index "people", ["group_id"], name: "index_people_on_group_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "startDate"
    t.datetime "endDate"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true
  end

  add_index "projects", ["group_id"], name: "index_projects_on_group_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "Admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
