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

ActiveRecord::Schema.define(version: 20171025060631) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "スレッドのコメント" do |t|
    t.string "body", limit: 60, comment: "コメント内容"
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "post_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "postとtagの中間テーブル" do |t|
    t.integer "post_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "スレッド" do |t|
    t.string "title", limit: 60, comment: "スレッドタイトル"
    t.text "body", comment: "スレッド内容"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "replies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "コメントへの返信" do |t|
    t.string "body", limit: 60, comment: "返信内容"
    t.bigint "user_id"
    t.bigint "post_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["post_id"], name: "index_replies_on_post_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "スレッドのタグ" do |t|
    t.string "category", limit: 100, comment: "タグ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ユーザー" do |t|
    t.string "email", limit: 100, default: "", null: false, comment: "ユーザーのメールアドレス"
    t.string "encrypted_password", limit: 100, default: "", null: false, comment: "ユーザーのパスワード"
    t.string "reset_password_token", limit: 100, comment: "新しいパスワード"
    t.datetime "reset_password_sent_at", comment: "パスワードリセット時の時間"
    t.datetime "remember_created_at", comment: "ユーザーのログイン情報の保持"
    t.integer "sign_in_count", default: 0, null: false, comment: "ログイン回数"
    t.datetime "current_sign_in_at", comment: "ログインすると更新されるタイムスタンプ"
    t.datetime "last_sign_in_at", comment: "前のログインのタイムスタンプ"
    t.string "current_sign_in_ip", limit: 100, comment: "ログインすると更新されるリモートIP"
    t.string "last_sign_in_ip", limit: 100, comment: "以前のログインのリモートIP"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", limit: 20, comment: "ユーザーの名前"
    t.index ["email", "reset_password_token"], name: "index_users_on_email_and_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "replies", "comments"
  add_foreign_key "replies", "posts"
  add_foreign_key "replies", "users"
end
