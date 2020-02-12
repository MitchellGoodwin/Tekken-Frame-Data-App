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
# User.destroy_all
# Character.destroy_all

puts "Making Users"

40.times do
    User.create(username: Faker::Internet.username, password_digest: "test", location: Faker::Nation.capital_city, picture_link: Faker::Avatar.image, bio: Faker::Lorem.paragraph)
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

puts "Adding Favorites"

User.all.each do |user|
    x = rand(1..4)
    x.times do
        Favorite.create(user: user, character: Character.all.sample)
    end
end

puts "Making forums"

Character.all.each do |character|
    Forum.create(character_id: character.id)
end

puts "Making posts"

300.times do
    Post.create(user_id: User.all.sample.id, forum_id: Forum.all.sample.id, content: Faker::Lorem.paragraph)
end

character = Character.find_by(name: "armor-king")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/c/c6/Armor_King_T7.jpg/revision/latest/scale-to-width-down/1000?cb=20181203160513&path-prefix=en"
character.save
character = Character.find_by(name: "heihachi")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/9/93/T7FR_Heihachi.jpeg/revision/latest?cb=20160402064045&path-prefix=en"
character.save
character = Character.find_by(name: "negan")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/2/21/Negan_T7.jpeg/revision/latest/scale-to-width-down/620?cb=20181215020236&path-prefix=en"
character.save
character = Character.find_by(name: "noctis")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/6/66/Noctis_T7.jpg/revision/latest/scale-to-width-down/620?cb=20171115011652&path-prefix=en"
character.save
character = Character.find_by(name: "akuma")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/5/5f/Tekken-7-Akuma-CG-art.jpg/revision/latest/scale-to-width-down/620?cb=20170408183224&path-prefix=en"
character.save
character = Character.find_by(name: "asuka")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/b/b2/T7FR_Asuka.jpg/revision/latest?cb=20170706000737&path-prefix=en"
character.save
character = Character.find_by(name: "claudio")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/4/4c/Claudio_T7.jpg/revision/latest/scale-to-width-down/619?cb=20170408135758&path-prefix=en"
character.save
character = Character.find_by(name: "eliza")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/c/ce/T7_Eliza.jpg/revision/latest/scale-to-width-down/620?cb=20170408103954&path-prefix=en"
character.save
character = Character.find_by(name: "geese")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/f/f6/Tekken7-Geese.jpg/revision/latest/scale-to-width-down/620?cb=20170718111915&path-prefix=en"
character.save
character = Character.find_by(name: "gigas")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/b/bb/Gigas_CG.jpg/revision/latest/scale-to-width-down/620?cb=20170408135528&path-prefix=en"
character.save
character = Character.find_by(name: "josie")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/7/78/Josie_CG.jpg/revision/latest/scale-to-width-down/620?cb=20170408140034&path-prefix=en"
character.save
character = Character.find_by(name: "julia")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/6/62/Julia-chang-tekken7-artwork.png/revision/latest/scale-to-width-down/510?cb=20190217212139&path-prefix=en"
character.save
character = Character.find_by(name: "katarina")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/e/ed/016.jpg/revision/latest/scale-to-width-down/620?cb=20170408135251&path-prefix=en"
character.save
character = Character.find_by(name: "kazumi")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/a/a2/Kazumi_CG.jpg/revision/latest/scale-to-width-down/620?cb=20170408135406&path-prefix=en"
character.save
character = Character.find_by(name: "kazuya")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/0/04/Kazuya_T7.jpg/revision/latest/scale-to-width-down/620?cb=20170408140311&path-prefix=en"
character.save
character = Character.find_by(name: "lucky-chloe")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/a/a3/Tekken7-luckychloe-dengeki-2.jpg/revision/latest/scale-to-width-down/620?cb=20170408140200&path-prefix=en"
character.save
character = Character.find_by(name: "marduk")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/1/11/Craig_Marduk_T7.jpg/revision/latest/scale-to-width-down/620?cb=20181203160700&path-prefix=en"
character.save
character = Character.find_by(name: "paul")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/2/21/T7FR_Paul.jpg/revision/latest?cb=20170706000815&path-prefix=en"
character.save
character = Character.find_by(name: "shaheen")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/3/3e/Shaheen_T7.jpg/revision/latest/scale-to-width-down/620?cb=20170408135856&path-prefix=en"
character.save
character = Character.find_by(name: "bryan")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/f/f1/Bryan_T7FR.jpg/revision/latest/scale-to-width-down/620?cb=20170709141039&path-prefix=en"
character.save
character = Character.find_by(name: "devil-jin")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/4/4c/T7FR_DevilJin.jpg/revision/latest/scale-to-width-down/620?cb=20180827213232&path-prefix=en"
character.save
character = Character.find_by(name: "dragunov")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/3/35/Dragunov_Tekken_7_Fated_Retribution.jpg/revision/latest/scale-to-width-down/620?cb=20160704181205&path-prefix=en"
character.save
character = Character.find_by(name: "jin")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/3/3d/Jin_T7.jpg/revision/latest/scale-to-width-down/619?cb=20170408104150&path-prefix=en"
character.save
character = Character.find_by(name: "king")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/4/42/T7FR_King.jpg/revision/latest?cb=20170706000757&path-prefix=en"
character.save
character = Character.find_by(name: "lars")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/d/d6/Lars_T7.jpg/revision/latest/scale-to-width-down/620?cb=20170408140505&path-prefix=en"
character.save
character = Character.find_by(name: "leo")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/3/3c/T7FR_Leo.jpg/revision/latest/scale-to-width-down/620?cb=20180827213346&path-prefix=en"
character.save
character = Character.find_by(name: "lili")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/2/2b/Lili_Tekken_7_Fated_Retribution.jpg/revision/latest/scale-to-width-down/619?cb=20160627190235&path-prefix=en"
character.save
character = Character.find_by(name: "miguel")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/0/03/Miguel_T7FR.jpg/revision/latest/scale-to-width-down/620?cb=20170408104320&path-prefix=en"
character.save
character = Character.find_by(name: "zafina")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/9/93/Zafina_T7_HD.jpg/revision/latest/scale-to-width-down/620?cb=20190806032217&path-prefix=en"
character.save
character = Character.find_by(name: "alisa")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/b/b2/T7FR_Alisa.jpg/revision/latest?cb=20170706000727&path-prefix=en"
character.save
character = Character.find_by(name: "anna")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/c/c2/Tekken-7_2018_08-06-18_015.jpg/revision/latest/scale-to-width-down/620?cb=20180806193707&path-prefix=en"
character.save
character = Character.find_by(name: "bob")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/5/5e/Bob_T7FR.jpg/revision/latest/scale-to-width-down/620?cb=20170615201903&path-prefix=en"
character.save
character = Character.find_by(name: "feng")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/1/16/Feng_T7FR.jpg/revision/latest/scale-to-width-down/620?cb=20170404130105&path-prefix=en"
character.save
character = Character.find_by(name: "hwoarang")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/5/5e/T7FR_Hwoarang.jpg/revision/latest/scale-to-width-down/620?cb=20170606192522&path-prefix=en"
character.save
character = Character.find_by(name: "jack7")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/4/44/Jack-7_T7FR.jpg/revision/latest/scale-to-width-down/620?cb=20170409122754&path-prefix=en"
character.save
character = Character.find_by(name: "kuma")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/b/b9/Panda_T7.jpg/revision/latest/scale-to-width-down/620?cb=20170408134929&path-prefix=en"
character.save
character = Character.find_by(name: "lee")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/2/22/Lee_T7.jpg/revision/latest/scale-to-width-down/619?cb=20170408133603&path-prefix=en"
character.save
character = Character.find_by(name: "master-raven")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/1/1d/MasterRavenT7.jpg/revision/latest/scale-to-width-down/620?cb=20191018004040&path-prefix=en"
character.save
character = Character.find_by(name: "nina")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/6/63/NinaT7CG.jpeg/revision/latest/scale-to-width-down/620?cb=20170408184702&path-prefix=en"
character.save
character = Character.find_by(name: "eddy")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/5/56/Eddy_Gordo_T7.jpg/revision/latest/scale-to-width-down/620?cb=20170408103724&path-prefix=en"
character.save
character = Character.find_by(name: "law")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/e/e4/T7_Law.jpg/revision/latest/scale-to-width-down/620?cb=20170408184222&path-prefix=en"
character.save
character = Character.find_by(name: "steve")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/6/6b/T7FR_Steve.jpg/revision/latest?cb=20170706000824&path-prefix=en"
character.save
character = Character.find_by(name: "xiaoyu")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/6/6e/T7FR_Xiaoyu.jpg/revision/latest/scale-to-width-down/620?cb=20180827204115&path-prefix=en"
character.save
character = Character.find_by(name: "lei")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/2/2c/Tekken-7_2018_08-06-18_016.jpg/revision/latest/scale-to-width-down/620?cb=20180807001018&path-prefix=en"
character.save
character = Character.find_by(name: "yoshimitsu")
character.image_url = "https://vignette.wikia.nocookie.net/tekken/images/6/6e/Yoshi_TK7.jpg/revision/latest/scale-to-width-down/620?cb=20170409122615&path-prefix=en"
character.save


puts "Done seeding"


