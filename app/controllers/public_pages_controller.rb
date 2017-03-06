class PublicPagesController < ApplicationController
  #get/posts
  def index
    @Posts= Post.all 
  end

  def blog
  end

  def projects
  end

  def resume
  end

  def contact
  end
end
