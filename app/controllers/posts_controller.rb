class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #layout "admin"
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @count=0
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user_list =get_user_list
  end

  # GET /posts/new
  def new
    @post = Post.new
    @user_list=get_user_list 
    @all_tags= get_all_hashtags
  end

  # GET /posts/1/edit
  def edit
    @user_list=get_user_list
    @all_tags=get_all_hashtags
  end

  # POST /posts
  # POST /posts.json
  def create
    temp_params= post_params
    user_id= temp_params.delete(:user_id)
    
    @all_tags=get_all_hashtags 
    @post = Post.new(post_params)
    @post.user= User.find(user_id)
    respond_to do |format|
      if @post.save
        update_hashtags(@all_tags)
        flash[:notice]='Post was successfully created.' 
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        @user_list=get_user_list
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @user_list= get_user_list
    @all_tags= get_all_hashtags

    respond_to do |format|
      if @post.update(post_params)
        update_hashtags(@all_tags)
        flash[:notice]="This post was Successfully updated."
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        #render action: 'edit'
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_post      # Use callbacks to share common setup or constraints between actions.
    @post = Post.friendly.find(params[:id])
  end

  def post_params   # Never trust parameters from the scary internet, only allow the white list through.
    #params.fetch(:post, {:title, :body, :user_id, :status, :created_at})
    params.require(:post).permit(:title, :body, :user_id, :status, :hashtags, :created_at)
  end

  def get_user_list
    return User.all.collect{|user| [user.name, user.id]}
  end

  def get_all_hashtags
    return Hashtag.all
    #return Hashtag.order(name: :asc)
  end
  
  def get_tags_form(tag_list)
    tag_list=[] if tag_list.blank?
    return tag_list.collect{|tag_id| Hashtag.find_by_id(tag_id.to_i)}.compact
  end
  
  def update_hashtags(all_tags)
    checked_tags= get_tags_form(params[:hashtags])   
    remove_tags = all_tags- checked_tags
    checked_tags.each{|tag| @post.hashtags << tag if !@post.hashtags.include?(tag)}
    remove_tags.each {|tag| @post.hashtags.delete(tag) if @post.hashtags.include?(tag)}
  end


end
