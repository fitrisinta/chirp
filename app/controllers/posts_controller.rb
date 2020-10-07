class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    # Use the order method to sort the posts by time created
    @posts = Post.all.order(created_at: :desc) 
  end

  def show
    #Finds and shows the post
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # Create a post with the data sent from the form
    @post = Post.new(content: params[:content])
    # Redirect to the "Posts" page if the @post is valid, and render the "New post" page if it isn't
    if @post.save
      # Store the message in flash[:notice]
      flash[:notice] = "Post successfully created"
      # Use the redirect_to method to redirect to the "Posts" page
      redirect_to("/posts/index")
    else 
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    # Update the post with the data sent from the form
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
       # Store the message in flash[:notice]
       flash[:notice] = "Post successfully edited"
       redirect_to("/posts/index")
    else
       # Use the render method to show the "Edit post" page without redirecting to the "edit" action
       render("posts/edit")
    end
  end

  def destroy
     # Get the post with params[:id] as the id, then destroy it
    @post = Post.find_by(id: params[:id])
    @post.destroy
    # Store the message in flash[:notice]
    flash[:notice] =  # Store the message in flash[:notice]
    redirect_to("posts/index")
  end
end
