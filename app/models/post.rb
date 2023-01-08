class Post < ApplicationRecord
  has_many :comments
  broadcasts
  after_destroy_commit :broadcast_remove_to_posts

  private

  def broadcast_remove_to_posts
    broadcast_remove_to "posts"
  end

end
