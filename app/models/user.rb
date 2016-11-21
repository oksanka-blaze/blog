class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates_presence_of :password
  validates_confirmation_of :password

  validates :first_name, length: { minimum: 2, maximum: 25 }, allow_blank: true
  validates :last_name, length: { minimum: 2, maximum: 25 }, allow_blank: true

  has_many :posts

  def display_name
    return 'User' if first_name.blank? && last_name.blank?
    "#{first_name} #{last_name}"
  end
end
