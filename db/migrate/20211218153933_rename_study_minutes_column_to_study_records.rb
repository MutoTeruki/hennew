class RenameStudyMinutesColumnToStudyRecords < ActiveRecord::Migration[6.1]
  def change
    rename_column :study_records, :study_minutues1, :study_minutes1
    rename_column :study_records, :study_minutues2, :study_minutes2
    rename_column :study_records, :study_minutues3, :study_minutes3
  end
end
