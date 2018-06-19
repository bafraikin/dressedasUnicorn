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

ActiveRecord::Schema.define(version: 2018_06_19_200257) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "fav_places", force: :cascade do |t|
    t.integer "place_id"
    t.integer "liker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["liker_id"], name: "index_fav_places_on_liker_id"
    t.index ["place_id"], name: "index_fav_places_on_place_id"
  end

  create_table "place_creators", force: :cascade do |t|
    t.integer "creator_id"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_place_creators_on_creator_id"
    t.index ["place_id"], name: "index_place_creators_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.float "longitude"
    t.float "latitude"
    t.string "address"
    t.integer "average_price"
    t.text "description"
    t.integer "map_id"
    t.integer "town_id"
    t.integer "tag_to_places_count"
    t.integer "place_creators_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count_of_comments"
    t.integer "nb_of_likers"
    t.index ["map_id"], name: "index_places_on_map_id"
    t.index ["town_id"], name: "index_places_on_town_id"
  end

  create_table "tag_to_places", force: :cascade do |t|
    t.integer "place_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_tag_to_places_on_place_id"
    t.index ["tag_id"], name: "index_tag_to_places_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "tag_to_places_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_comments", force: :cascade do |t|
    t.integer "place_id"
    t.integer "commentor_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentor_id"], name: "index_user_comments_on_commentor_id"
    t.index ["place_id"], name: "index_user_comments_on_place_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "place_creators_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.integer "comment_posteds"
    t.integer "nb_of_liked_places"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
