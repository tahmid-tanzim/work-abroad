# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Member.create!(
    name: "Tahmid Tanzim",
    national_id: 12345678901234567,
    email: "tahmid.tanzim@gmail.com",
    password: "foobar",
    password_confirmation: "foobar",
    admin: true,
    activated: true,
    activated_at: Time.zone.now
)

99.times do |n|
  name = Faker::Name.name
  national_id = Faker::Number.number(17)
  email = Faker::Internet.email
  password = Faker::Internet.password(10)
  Member.create!(
      name: name,
      national_id: national_id,
      email: email,
      password: password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now
  )
end
