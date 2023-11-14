# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
INTERESTS = [
  :cabo_san_lucas,
  :urban,
  :spring_break,
  :december_holiday_travel,
  :mountains,
  :family_friendly,
  :golf,
  :only_good_reviews,
  :budget,
]

def generate_interests
  INTERESTS.sample(rand(2..6))
end

20.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country_code: Faker::Address.country_code,
    interests: generate_interests
  )
end
