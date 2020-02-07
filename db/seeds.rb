# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'json'

20.times do
    User.create(username: Faker::Internet.username, password: "test", location: Faker::Nation.capital_city, picture_link: Faker::Avatar.image)
end



response = RestClient.get("https://t7frames-server.herokuapp.com/frame-data/")

tekken = JSON.parse(response.body)