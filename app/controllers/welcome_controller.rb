class WelcomeController < ApplicationController
  def index
    @posts = Post.latest
                 .includes(:user)
                 .paginate(page: params[:page], per_page: 5)
                 .decorate
  end
end
