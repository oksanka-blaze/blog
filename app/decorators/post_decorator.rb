class PostDecorator < Draper::Decorator
  delegate_all

  def author_name
    user.decorate.display_name
  end
end
