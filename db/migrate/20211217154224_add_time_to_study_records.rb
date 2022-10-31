class AddTimeToStudyRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :study_records, :study_hours1, :integer
    add_column :study_records, :study_minutues1, :integer
    add_column :study_records, :study_hours2, :integer
    add_column :study_records, :study_minutues2, :integer
    add_column :study_records, :study_hours3, :integer
    add_column :study_records, :study_minutues3, :integer
  end
end
