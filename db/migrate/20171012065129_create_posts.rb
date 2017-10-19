class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, limit: 60 # スレッドのタイトル
      t.text :body # スレッドの内容
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
