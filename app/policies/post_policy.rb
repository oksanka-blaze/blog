class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    !!user
  end

  def new?
    !!user
  end

  def update?
  end

  def edit?
  end

  def destroy?
    !!user && user == post.author
  end

end
