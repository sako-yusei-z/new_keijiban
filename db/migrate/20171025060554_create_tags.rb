class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags, comment: 'スレッドのタグ' do |t|
      t.string :category, null: true, limit: 100, comment: 'タグ'

      t.timestamps

      t.index ["category"], unique: true
    end
  end
end
