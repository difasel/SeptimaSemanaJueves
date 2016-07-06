class Post < ActiveRecord::Base
  # Remember to create a migration!
  validates :body, :presence => true
  validates :title, :presence => true
  validates :title, uniqueness: true
  has_many :post_tags
  has_many :tags, through: :post_tags
end
