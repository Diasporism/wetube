# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

conversation = Conversation.create
message_1 = conversation.messages.create(content: "My little message", user_id: 1)
message_2 = conversation.messages.create(content: "Tacos plz", user_id: 3)