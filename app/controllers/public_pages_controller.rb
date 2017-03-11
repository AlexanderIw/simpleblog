class PublicPagesController < ApplicationController
  def index
    @post = Post.order(created_at: 'DESC').limit(3) #SELECT * FROM posts ORDER BY created_at DESC LIMIT 3;
  end

  def article
    @post = Post.friendly.find(params[:id])
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
