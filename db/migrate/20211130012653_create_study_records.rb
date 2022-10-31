class CreateStudyRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :study_records do |t|
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.float :study_time

      t.timestamps
    end
  end
end
