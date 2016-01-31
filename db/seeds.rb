# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Test users
user = User.create({ email: 'user@user.user', password: 'useruser', first_name: "User", last_name: "User" })
joe = User.create({ email: 'joe@joe.joe', password: 'joejoejoe', first_name: "Joe", last_name: "Joe" })
moe = User.create({ email: 'moe@moe.moe', password: 'moemoemoe', first_name: "Moe", last_name: "Moe" })

# Test messages
user_msg = Message.create({creator: user, content: "User test message 1" })
user_msg = Message.create({creator: user, content: "User's Message" })
user_msg = Message.create({creator: user, content: "Something something" })
joe_msg = Message.create({creator: joe, content: "Joe's message" })
joe_msg = Message.create({creator: joe, content: "Joe wrote this" })
joe_msg = Message.create({creator: joe, content: "Jojo" })
moe_msg = Message.create({creator: moe, content: "Moe wrote this one" })
moe_msg = Message.create({creator: moe, content: "Something moe wanted to do at some point in the future" })
moe_msg = Message.create({creator: moe, content: "150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars!" })
#_msg = Message.create({creator: , content: "" })


