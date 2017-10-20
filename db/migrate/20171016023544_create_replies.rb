class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies, comment: 'コメントへの返信' do |t|
      t.string :body, limit: 60, comment: '返信内容'
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
