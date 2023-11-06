# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do
    Student.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.username,
        password: :first_name.to_s + :last_name.to_s 
    )
end

# 6.times do
#     PresentationEvent.create(
#         event_name: Faker::University.name,
#         due: Faker::Time.forward(days: 23, period: :morning),
#         status: "Open"
#     )
# end

# 10.times do
#     Team.create(
#         team_name: Faker::University.name
#     )
# end