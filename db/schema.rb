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

ActiveRecord::Schema.define(version: 20170306080016) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "hashtags", force: :cascade do |t|
    t.string   "name",        limit: 50,  default: "", null: false
    t.string   "relation",    limit: 25,  default: "", null: false
    t.string   "description", limit: 140, default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hashtags_posts", force: :cascade do |t|
    t.integer "hashtag_id", limit: 4
    t.integer "post_id",    limit: 4
  end

  add_index "hashtags_posts", ["hashtag_id"], name: "index_hashtags_posts_on_hashtag_id", using: :btree
  add_index "hashtags_posts", ["post_id"], name: "index_hashtags_posts_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "title",      limit: 100,   default: "", null: false
    t.text     "body",       limit: 65535,              null: false
    t.string   "status",     limit: 25,    default: "", null: false
    t.string   "proj_link",  limit: 100,   default: ""
    t.string   "img_link",   limit: 100,   default: ""
    t.string   "slug",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 60,                null: false
    t.string   "email",           limit: 50,                null: false
    t.string   "username",        limit: 25,                null: false
    t.text     "bio",             limit: 65535,             null: false
    t.string   "password_digest", limit: 255,               null: false
    t.integer  "user_level",      limit: 1,                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "posts_count",     limit: 4,     default: 0, null: false
  end

end
