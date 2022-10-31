class TalksController < ApplicationController
  before_action :authenticate_user!
    def index
      if params[:search] == nil
        @talks= Talk.all
      elsif params[:search] == ''
        @talks= Talk.all
      else
        #部分検索
        @talks = Talk.where("body LIKE ? ",'%' + params[:search] + '%')
      end
    end
    
    def new
        @talk = Talk.new    
    end

    def create
        talk = Talk.new(talk_params)
        talk.user_id = current_user.id
        if talk.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
      
    def show
      @talk = Talk.find(params[:id])
      @talk_comments = @talk.talk_comments
      @talk_comment = TalkComment.new
    end

    def edit
      @talk = Talk.find(params[:id])
    end

    def update
      talk = Talk.find(params[:id])
      if talk.update(talk_params)
        redirect_to :action => "show", :id => talk.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      talk = Talk.find(params[:id])
      talk.destroy
      redirect_to action: :index
    end

    private
    def talk_params
      params.require(:talk).permit(:body)
    end

end
