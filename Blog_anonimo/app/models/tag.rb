class Tag < ActiveRecord::Base
  # Remember to create a migration!
  # validates :tag, :presence => true
  validates :tag, uniqueness: true
  has_many :post_tags
  has_many :posts, through: :post_tags
end
