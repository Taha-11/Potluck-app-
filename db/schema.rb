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

ActiveRecord::Schema.define(version: 20150320191425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "potlock_id"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["potlock_id"], name: "index_comments_on_potlock_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.integer  "user_id"
  end

  create_table "inverse_friendships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "sender_id"
    t.string   "recipient_email"
    t.string   "token"
    t.datetime "sent_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "potlock_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "potlock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["potlock_id"], name: "index_items_on_potlock_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "listing_items_tables", force: :cascade do |t|
    t.string "food_choice"
  end

  create_table "potlocks", force: :cascade do |t|
    t.string   "create"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "image"
    t.string   "meal"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "due_date"
    t.text     "listing_items"
    t.boolean  "selected"
    t.integer  "user_id"
  end

  add_index "potlocks", ["user_id"], name: "index_potlocks_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "first_name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "provider"
    t.string   "uid"
    t.text     "oauth_token"
    t.datetime "oauth_expires_at"
    t.integer  "invitation_id"
    t.string   "name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "potlocks"
  add_foreign_key "comments", "users"
  add_foreign_key "items", "potlocks"
  add_foreign_key "items", "users"
  add_foreign_key "potlocks", "users"
end
