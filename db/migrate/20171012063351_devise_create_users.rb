class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "", limit: 80 # userのEmail
      t.string :encrypted_password, null: false, default: "", limit: 300 # ログイン時の認証パスワード

      ## Recoverable
      t.string   :reset_password_token, limit: 300 # パスワードリセット時のトークン
      t.datetime :reset_password_sent_at # パスワードリセット時の通知時間

      ## Rememberable
      t.datetime :remember_created_at # 保存されたcookieからユーザーを記憶

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false # userのサインイン回数
      t.datetime :current_sign_in_at # userのサインイン時間
      t.datetime :last_sign_in_at # 最後にサインインしたuserの時間
      t.string   :current_sign_in_ip, limit: 40 # サインイン時のuserのIPアドレス
      t.string   :last_sign_in_ip, limit: 40 # 最後にサインインしたuserのIPアドレス

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
