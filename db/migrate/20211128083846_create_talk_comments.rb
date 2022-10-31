class CreateTalkComments < ActiveRecord::Migration[6.1]
  def change
    create_table :talk_comments do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :talk, null: false, foreign_key: true

      t.timestamps
    end
  end
end
