class TalkCommentsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      talk = Talk.find(params[:talk_id])
      talk_comment = talk.talk_comments.build(talk_comment_params) #buildを使い、contentとtweet_idの二つを同時に代入
      talk_comment.user_id = current_user.id
      if talk_comment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
    private
  
      def talk_comment_params
        params.require(:talk_comment).permit(:body)
      end
  end