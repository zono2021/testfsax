class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.all.order(created_at: :desc)
  end



def new
end

def create
  @post = Post.new(
    user_id: params[:user_id],
    title: params[:title],
    body: params[:body]
    )
  if @post.save
    redirect_to("/posts/index")
  else
    flash[:errors] = @post.errors.full_messages
    redirect_to("/posts/new")
    binding.pry
  end
end

def destroy
  @post = Post.find_by(id: params[:id])
  @post.destroy
  redirect_to("/posts/index")
end

def edit
  @post = Post.find_by(id: params[:id])
end

def update
  @post = Post.find_by(id: params[:id])
  @post.user_id = params[:user_id]
  @post.title = params[:title]
  @post.body = params[:body]
  if @post.save
    redirect_to("/posts/index")
  else
    flash[:errors] = @post.errors.full_messages
    redirect_to("/posts/edit")
  end
end

end