class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts, comment: 'スレッド' do |t|
      t.string :title, limit: 60, comment: 'スレッドタイトル'
      t.text :body, limit: 600, comment: 'スレッド内容'
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
