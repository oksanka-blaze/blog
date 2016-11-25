class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 2, maximum: 255 }
  validates :body, presence: true, length: { minimum: 10, maximum: 6555 }
  validates :user_id, presence: true
end
