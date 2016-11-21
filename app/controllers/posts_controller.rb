class PostsController < ApplicationController

  def index
    @posts = Post.all
                 .order(created_at: :desc)
                 .paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: 'Post successfully created!'
    else
      redirect_to new_post_path, alert: 'Invalid Post!'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end

end