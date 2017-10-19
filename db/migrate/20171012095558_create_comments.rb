class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, comment: 'スレッドのコメント' do |t|
      t.string :body, limit: 60, comment: 'コメント内容'
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
