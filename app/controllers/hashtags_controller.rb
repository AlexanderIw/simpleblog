class HashtagsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :logged_in_user, only:[:index, :show, :new, :edit, :create, :update, :destroy]

    def index
        @tags=Hashtag.all
        @count=0
    end

    def new
        @tag = Hashtag.new
    end
    
    def edit 
    end

    def show 
    end

    def create
        @tag = Hashtag.new(tag_params)
        if @tag.save
            redirect_to hashtags_path, flash: {notice: 'Hashtag was successfully created.'}
            #redirect_to(controller: :hashtags, action: :index, notice: )
        else
            redirect_to hashtags_path, flash: {notice: 'failed to create new hashtag.'}
        end
    end

    def update
        if @tag.update(tag_params)
            redirect_to hashtags_path, flash: {notice: 'Hashtag was successfully updated.'}
        else
            redirect_to hashtags_path, flash: {notice: 'Hashtag failed to update.'}
        end
    end

    private
    def set_post      # Use callbacks to share common setup or constraints between actions.
        @tag = Hashtag.find(params[:id])
    end
    
    def tag_params   # Never trust parameters from the scary internet, only allow the white list through.
        params.require(:hashtag).permit(:name, :subject, :description)
    end
    
end