class StudyRecordsController < ApplicationController
    def index
      @study_records = StudyRecord.all
      @hour = "時間"
      @minute = "分"
      @rank_study_records1 = StudyRecord.all.sort {|a,b| b.study_minutes1 <=> a.study_minutes1}
      @rank_study_records1 = StudyRecord.all.sort {|a,b| b.study_hours1 <=> a.study_hours1}
      @rank_study_records2 = StudyRecord.all.sort {|a,b| b.study_minutes2 <=> a.study_minutes2}
      @rank_study_records2 = StudyRecord.all.sort {|a,b| b.study_hours2 <=> a.study_hours2}
      @rank_study_records3 = StudyRecord.all.sort {|a,b| b.study_minutes3 <=> a.study_minutes3}
      @rank_study_records3 = StudyRecord.all.sort {|a,b| b.study_hours3 <=> a.study_hours3}
    end

    def new
      @study_record = StudyRecord.new  #Study_recordなどにしないように注意
    end

    def create
        study_record = StudyRecord.new(study_record_params)
        study_record.user_id = current_user.id
        if study_record.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      private
      def study_record_params
        params.require(:study_record).permit(:study_hours1, :study_minutes1, :study_hours2, :study_minutes2, :study_hours3, :study_minutes3)
      end
end
