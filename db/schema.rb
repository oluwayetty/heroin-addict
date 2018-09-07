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

ActiveRecord::Schema.define(version: 20180903224740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatroom_users", force: :cascade do |t|
    t.integer  "chatroom_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "last_read_at"
    t.index ["chatroom_id"], name: "index_chatroom_users_on_chatroom_id", using: :btree
    t.index ["user_id"], name: "index_chatroom_users_on_user_id", using: :btree
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "direct_message", default: false
    t.integer  "creator_id"
  end

  create_table "daily_moods", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "mood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journal_viewers", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "journal_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["journal_id"], name: "index_journal_viewers_on_journal_id", using: :btree
    t.index ["user_id", "journal_id"], name: "index_journal_viewers_on_user_id_and_journal_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_journal_viewers_on_user_id", using: :btree
  end

  create_table "journals", force: :cascade do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_journals_on_user_id", using: :btree
  end

  create_table "letters", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.string   "recipient"
    t.string   "sender"
    t.string   "subject"
    t.text     "body"
    t.index ["user_id"], name: "index_letters_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "chatroom_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.text     "body"
    t.string   "image"
    t.string   "video"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_statuses_on_user_id", using: :btree
  end

  create_table "supported_users", force: :cascade do |t|
    t.integer  "supporter_id"
    t.integer  "addict_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["supporter_id", "addict_id"], name: "index_supported_users_on_supporter_id_and_addict_id", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "username"
    t.boolean  "supporter",              default: false
    t.text     "goal"
    t.boolean  "admin",                  default: false
    t.string   "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "chatroom_users", "chatrooms"
  add_foreign_key "chatroom_users", "users"
  add_foreign_key "journal_viewers", "journals"
  add_foreign_key "journal_viewers", "users"
  add_foreign_key "journals", "users"
  add_foreign_key "letters", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "statuses", "users"
end
