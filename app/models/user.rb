class User < ApplicationRecord
  #tell that User has many articles
  has_many :articles
  has_many :comments
  has_many :likes
end
