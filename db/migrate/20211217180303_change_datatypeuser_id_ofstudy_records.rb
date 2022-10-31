class ChangeDatatypeuserIdOfstudyRecords < ActiveRecord::Migration[6.1]
  def change
    change_column :study_records, :user_id, :integer
  end
end
