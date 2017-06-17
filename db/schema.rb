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

ActiveRecord::Schema.define(version: 20170617124252) do

  create_table "exams", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fill_responses", force: :cascade do |t|
    t.integer  "respondent_id"
    t.integer  "question_id"
    t.string   "answer"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "homeland_nodes", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "description"
    t.string   "color"
    t.integer  "sort",         default: 0, null: false
    t.integer  "topics_count", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["sort"], name: "index_homeland_nodes_on_sort"
  end

  create_table "homeland_replies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "body"
    t.text     "body_html"
    t.datetime "deleted_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "reply_to_id"
    t.index ["reply_to_id"], name: "index_homeland_replies_on_reply_to_id"
    t.index ["topic_id"], name: "index_homeland_replies_on_topic_id"
    t.index ["user_id"], name: "index_homeland_replies_on_user_id"
  end

  create_table "homeland_topics", force: :cascade do |t|
    t.integer  "node_id",                        null: false
    t.integer  "user_id",                        null: false
    t.string   "title",                          null: false
    t.text     "body"
    t.text     "body_html"
    t.integer  "last_reply_id"
    t.integer  "last_reply_user_id"
    t.integer  "last_active_mark",   default: 0, null: false
    t.datetime "replied_at"
    t.integer  "replies_count",      default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["deleted_at"], name: "index_homeland_topics_on_deleted_at"
    t.index ["last_active_mark", "deleted_at"], name: "index_homeland_topics_on_last_active_mark_and_deleted_at"
    t.index ["node_id", "deleted_at"], name: "index_homeland_topics_on_node_id_and_deleted_at"
    t.index ["node_id", "last_active_mark"], name: "index_homeland_topics_on_node_id_and_last_active_mark"
    t.index ["user_id"], name: "index_homeland_topics_on_user_id"
  end

  create_table "join_options", force: :cascade do |t|
    t.integer  "response_option_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "url"
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multi_responses", force: :cascade do |t|
    t.integer  "respondent_id"
    t.integer  "question_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string   "title"
    t.string   "type"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "type"
    t.integer  "options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "exam_id"
    t.text     "text"
    t.boolean  "multi"
    t.index ["exam_id"], name: "index_questions_on_exam_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "respondents", force: :cascade do |t|
    t.integer  "exam_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "response_options", force: :cascade do |t|
    t.integer  "question_id"
    t.text     "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
