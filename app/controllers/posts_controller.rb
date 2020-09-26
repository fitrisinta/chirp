class PostsController < ApplicationController

  #loads all posts
  def index
    @posts = Post.all 
  end

  #shows the post
  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    # Use the redirect_to method to redirect to the "Posts" page
    redirect_to("/posts/index")
  end

end
