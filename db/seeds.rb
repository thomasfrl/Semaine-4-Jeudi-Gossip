# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bundler'
Bundler.require

Gosip.destroy_all
User.destroy_all
Tag.destroy_all
City.destroy_all
JoinTableGossipTag.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'gosips'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'tags'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cities'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'join_table_gossip_tags'")

10.times do 
    c = City.create!(name: Faker::Nation.capital_city, zip_code: Faker::Code.asin)
end

10.times do 
    t = Tag.create!(title: Faker::ProgrammingLanguage.name)
end

10.times do 
    u = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::HarryPotter.quote, email: Faker::Internet.email, city_id: City.all.sample.id, age: rand(1..90))
end

20.times do 
    g = Gosip.create!(title: Faker::HarryPotter.character, content: Faker::HarryPotter.quote, user_id: User.all.sample.id)
end

Gosip.all.each do |gossip|
    rand(1..3).times do
        jt = JoinTableGossipTag.create!(gosip_id: gossip.id, tag_id: Tag.all.sample.id)
    end
end

40.times do
    m = PrivateMessage.create!(content: Faker::ChuckNorris.fact, sender_id: User.all.sample.id, recipient_id: User.all.sample.id)
end