class PostsController < ApplicationController

  before_action :check_auth, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create post_params
    if @post.persisted?
      flash[:success] = "Your link has been posted."
      redirect_to root_path
    else
      flash[:danger] = @post.errors.full_messages.uniq.to_sentence
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:link)
  end
end
