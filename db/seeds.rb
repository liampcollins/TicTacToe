# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



u1 = User.create([{email: 'sam@sam.com'}, {username: "Sam"}, {firt_name: "Sam"}, {password: "sam"}, {password_confirmation: "sam"}])

u2 = User.create([{email: 'dave@dave.com'}, {username: "Dave"}, {firt_name: "Dave"}, {password: "dave"}, {password_confirmation: "dave"}])

u3 = User.create([{email: 'tom@tom.com'}, {username: "Tom"}, {firt_name: "Tom"}, {password: "tom"}, {password_confirmation: "tom"}])



