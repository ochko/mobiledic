# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090611131518) do

  create_table "learn_details", :force => true do |t|
    t.integer  "user_id"
    t.integer  "word_id"
    t.integer  "quiz_type_id"
    t.integer  "quiz_id"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learn_generals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "word_id"
    t.integer  "quiz_type_id"
    t.integer  "repetition",      :default => 0
    t.float    "eazyness_factor", :default => 2.5
    t.datetime "reviewed_at"
    t.datetime "planned_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "interval"
    t.integer  "q"
  end

  create_table "learn_processes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "word_id"
    t.integer  "quiz_type_id"
    t.float    "eazyness_factor", :default => 2.5
    t.datetime "reviewed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "interval"
    t.integer  "q"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "passwords", :force => true do |t|
    t.integer  "user_id"
    t.string   "reset_code"
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "quizzes", :force => true do |t|
    t.integer  "word_id"
    t.integer  "quiz_type_id"
    t.text     "question"
    t.text     "options"
    t.string   "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "identity_url"
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.string   "activation_code",           :limit => 40
    t.string   "state",                                    :default => "passive", :null => false
    t.datetime "remember_token_expires_at"
    t.datetime "activated_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_activity_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "words", :force => true do |t|
    t.string   "word"
    t.string   "clause"
    t.string   "pronunciation"
    t.string   "english_definition"
    t.string   "mongolian_definition"
    t.text     "english_sentence"
    t.text     "mongolian_sentence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
