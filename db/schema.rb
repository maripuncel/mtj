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

ActiveRecord::Schema.define(:version => 20121210063400) do

  create_table "answers", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interviews", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "questions"
    t.float    "rating"
    t.string   "position"
  end

  create_table "offers", :force => true do |t|
    t.integer  "figure"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "position"
  end

  create_table "questions", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "votes"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "serial"
    t.boolean  "activated"
    t.boolean  "admin",      :default => false, :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "question"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
