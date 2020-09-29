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

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    # Update the post with the data sent from the form
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/posts/index")
  end

  def destroy
     # Get the post with params[:id] as the id, then destroy it
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("posts/index")
  end
end
