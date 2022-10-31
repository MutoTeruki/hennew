class CreateTalks < ActiveRecord::Migration[6.1]
  def change
    create_table :talks do |t|
      t.text :body
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
