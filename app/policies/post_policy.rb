class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @record = post
  end

  def create?
    user
  end

  def new?
    user
  end

  def update?
    user
  end

  def edit?
    user
  end

  def destroy?
    user
  end
end
