class PostDecorator < Draper::Decorator
  delegate_all

  def author_name
    user.decorate.display_name
  end

  def formatted_created_at
    created_at.strftime('%d %b %Y %H:%M ')
  end
end
