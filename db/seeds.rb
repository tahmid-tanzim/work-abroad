# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.create!(fullname: "Example Member", national_id: 12345678901234567, email: "example@railstutorial.org", password: "foobar", password_confirmation: "foobar", admin: true)

99.times do |n|
  fullname = Faker::Name.name
  national_id = Faker::Number.number(17)
  email = Faker::Internet.email
  password = Faker::Internet.password(10)
  Member.create!(fullname: fullname,
                 national_id: national_id,
                 email: email,
                 password: password,
                 password_confirmation: password)
end
