class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :bio, length: { minimum: 30 }
  validates :age, numericality: {  greater_than_or_equal_to: 0 }

  def total_likes
    self.posts.inject(0){|s, i| s + i.likes}
  end
end
