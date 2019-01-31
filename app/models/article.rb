class Article < ApplicationRecord
  #dit qu'un article n'a qu'un seul user
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :likes
end
