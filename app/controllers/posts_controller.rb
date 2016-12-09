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
      redirect_to post_path(@post), notice: t('flash.posts.notice.post_created')
    else
      redirect_to new_post_path, alert: @post.errors.values.join(', ')
    end
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post

    if @post.destroy
      redirect_to posts_path, notice: t('flash.posts.notice.post_deleted')
    else
      redirect_to post_path(@post), alert: t('flash.posts.notice.error_delete_post')
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end

end