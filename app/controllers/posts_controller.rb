class PostsController < ApplicationController
  
  def index
    # Use the order method to sort the posts by time created
    @posts = Post.all.order(created_at: :desc) 
  end

  #shows the post
  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    # Create a post with the data sent from the form
    @post = Post.new(content: params[:content])
    @post.save
    # Use the redirect_to method to redirect to the "Posts" page
    redirect_to("/posts/index")
  end

end
