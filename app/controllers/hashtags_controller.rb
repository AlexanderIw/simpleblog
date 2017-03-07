class HashtagsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @tags=Hashtag.all
        @count=1
    end


    def list

    end
end
