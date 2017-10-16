class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, limit: 60
      t.text :body, limit: 600
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
