class PostsController < ApplicationController
  after_action :verify_authorized, only: [:new, :create, :destroy, :update]

  def index
    @posts = Post.latest
                 .includes(:user)
                 .paginate(page: params[:page], per_page: 20)
                 .decorate
  end

  def show
    @post = Post.find(params[:id]).decorate
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    if @post.save
      redirect_to post_path(@post), notice: 'Post successfully created!'
    else
      redirect_to new_post_path, alert: @post.errors.full_messages.join(', ')
    end
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end

end