class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def average_age
    bloggers = self.posts.collect{|p| p.blogger}.uniq
    bloggers_age_sum = bloggers.inject(0){|s, i| s + i.age}
    bloggers_age_sum/bloggers.size
  end
end
