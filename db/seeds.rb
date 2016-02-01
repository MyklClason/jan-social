# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Demo users
user = User.create({ email: 'user@user.user', password: 'useruser', first_name: "User", last_name: "User" })
joe = User.create({ email: 'joe@joe.joe', password: 'joejoejoe', first_name: "Joe", last_name: "Joe" })
moe = User.create({ email: 'moe@moe.moe', password: 'moemoemoe', first_name: "Moe", last_name: "Moe" })
luo = User.create({ email: 'luo@luo.luo', password: 'luoluoluo', first_name: "Dou", last_name: "Lou" })

# Demo Follows
joe.followed_by user
moe.followed_by user
luo.followed_by user
user.followed_by joe
moe.followed_by joe
luo.followed_by joe
user.followed_by moe
user.followed_by luo
moe.followed_by luo

# Demo messages
user_msg1 = Message.create({creator: user, content: "User test message 1" })
user_msg2 = Message.create({creator: user, content: "User's Message" })
user_msg3 = Message.create({creator: user, content: "Something something" })
joe_msg1 = Message.create({creator: joe, content: "Joe's message" })
joe_msg2 = Message.create({creator: joe, content: "Joe wrote this" })
joe_msg3 = Message.create({creator: joe, content: "Jojo" })
moe_msg1 = Message.create({creator: moe, content: "Moe wrote this one" })
moe_msg2 = Message.create({creator: moe, content: "Something moe wanted to do at some point in the future" })
moe_msg3 = Message.create({creator: moe, content: "150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars 150 chars!" })
luo_msg1 = Message.create({creator: luo, content: "Dou Lou was here" })
luo_msg2 = Message.create({creator: luo, content: "Some random stuff" })
luo_msg3 = Message.create({creator: luo, content: "Over there" })

# Demo Likes/dislikes
user_msg1.liked_by user
user_msg1.liked_by joe
user_msg1.liked_by moe
user_msg1.liked_by luo

user_msg2.liked_by user
user_msg2.liked_by joe
user_msg2.liked_by luo

user_msg3.liked_by user
user_msg3.liked_by moe
user_msg2.disliked_by luo

joe_msg1.liked_by user
user_msg2.disliked_by joe
user_msg2.disliked_by moe

joe_msg2.liked_by moe
joe_msg2.liked_by luo
user_msg2.disliked_by user

joe_msg3.disliked_by user
joe_msg3.disliked_by joe
joe_msg3.disliked_by moe
joe_msg3.disliked_by luo

moe_msg1.liked_by joe
moe_msg1.liked_by moe

moe_msg2.liked_by joe
joe_msg3.disliked_by luo

luo_msg1.liked_by user
luo_msg1.liked_by moe

luo_msg2.liked_by user
luo_msg2.liked_by luo
joe_msg3.disliked_by moe

luo_msg3.liked_by moe


