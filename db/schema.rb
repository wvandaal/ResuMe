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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130814171800) do

  create_table "code_files", :force => true do |t|
    t.string   "pathname"
    t.string   "language"
    t.text     "code"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "logo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "degrees", :force => true do |t|
    t.string   "field"
    t.string   "d_type"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "concentration"
    t.text     "details"
    t.float    "gpa"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "school_id"
  end

  create_table "positions", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.integer  "company_id"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "department"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "screenshot"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.string   "logo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "type"
    t.string   "background_img"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "admin",           :default => false
    t.string   "title"
    t.string   "location"
    t.string   "profile_pic"
    t.integer  "school_id"
  end

end
