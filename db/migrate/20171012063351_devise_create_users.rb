class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, comment: 'ユーザー' do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "", limit: 100, comment: 'ユーザーのメールアドレス'
      t.string :encrypted_password, null: false, default: "", limit: 100, comment: 'ユーザーのパスワード'

      ## Recoverable
      t.string   :reset_password_token, limit: 100, comment: 'パスワードリセット時のトークン'
      t.datetime :reset_password_sent_at, comment: 'パスワードリセット時の時間'

      ## Rememberable
      t.datetime :remember_created_at, comment: 'ユーザーを記憶するための時間'

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false, comment: 'ログイン回数'
      t.datetime :current_sign_in_at, comment: 'ログイン時間'
      t.datetime :last_sign_in_at, comment: '最後にログインした時間'
      t.string   :current_sign_in_ip, limit: 100, comment: 'ログイン時のIPアドレス'
      t.string   :last_sign_in_ip, limit: 100, comment: '最後のログイン時のIPアドレス'

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
