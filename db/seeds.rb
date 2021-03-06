# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Users
9.times do |n|
  name  = Faker::Name.first_name
  email = "example-#{n+1}@dartmouth.edu"
  password = "ffffff"
  User.create!(first_name: name,
  						last_name: Faker::Name.last_name,
              email: email,
              password:              password,
              password_confirmation: password,
              )


end

# Following relationships
users = User.all
user  = users.first
following = users[2..5]
followers = users[3..4]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }