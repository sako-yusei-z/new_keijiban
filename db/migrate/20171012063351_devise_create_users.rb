class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, comment: 'ユーザー' do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "", limit: 100, comment: 'ユーザーのメールアドレス'
      t.string :encrypted_password, null: false, default: "", limit: 100, comment: 'ユーザーのパスワード'

      ## Recoverable
      t.string   :reset_password_token, limit: 100, comment: '新しいパスワード'
      t.datetime :reset_password_sent_at, comment: 'パスワードリセット時の時間'

      ## Rememberable
      t.datetime :remember_created_at, comment: 'ユーザーのログイン情報の保持'

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false, comment: 'ログイン回数'
      t.datetime :current_sign_in_at, comment: 'ログインすると更新されるタイムスタンプ'
      t.datetime :last_sign_in_at, comment: '前のログインのタイムスタンプ'
      t.string   :current_sign_in_ip, limit: 100, comment: 'ログインすると更新されるリモートIP'
      t.string   :last_sign_in_ip, limit: 100, comment: '以前のログインのリモートIP'

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
