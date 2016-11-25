class UserDecorator < Draper::Decorator
  delegate_all

  def display_name
    return 'User' if first_name.blank? && last_name.blank?
    "#{first_name} #{last_name}"
  end
end
