# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

p "destroy database"
User.destroy_all
Article.destroy_all
Category.destroy_all
Comment.destroy_all
Like.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'articles'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'comments'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'categories'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'likes'")


10.times do 
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
  p "user #{user.first_name}"
end

5.times do
  category = Category.create(name: Faker::Job.education_level)
  p "category #{category.name}"
end

10.times do 
  article = Article.create!(user_id: rand(1..10), category_id: rand(1..5), title: Faker::Job.key_skill, content: Faker::ChuckNorris.fact)
  p "article #{article.title} : #{article.content}"
end

15.times do
  comment = Comment.create(user_id: rand(1..10), article_id: rand(1..10), content: Faker::TvShows::Simpsons.quote)
  p "comment #{comment.content}"
end

15.times do
  like = Like.create(user_id: rand(1..10), article_id: rand(1..10))
end


