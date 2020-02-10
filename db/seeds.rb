# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'
require 'pry'
User.destroy_all
Character.destroy_all

puts "Making Users"

40.times do
    User.create(username: Faker::Internet.username, password: "test", location: Faker::Nation.capital_city, picture_link: Faker::Avatar.image)
end


puts "Getting API data"
response = RestClient.get("https://t7frames-server.herokuapp.com/frame-data/")

tekken = JSON.parse(response)

puts "Making characters and moves..."

tekken.each do |key, character|
    ch = Character.create(name: character["character"])
    character["moves"].each do |move|
        nm = Move.create(move.transform_keys! &:downcase)
        nm.character_id = ch.id
        nm.save
    end
end

puts "Making forums"

Character.all.each do |character|
    Forum.create(character_id: character.id)
end

puts "Making posts"

150.times do
    Post.create(user_id: User.all.sample.id, forum_id: Forum.all.sample.id, content: Faker::Lorem.paragraph)
end



puts "Done seeding"


