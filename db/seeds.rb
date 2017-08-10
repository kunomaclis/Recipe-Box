# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'Faker'

10.times do
  Category.create!(
    name: Faker::Hipster.word
    )
end

5.times do
  Recipe.create!(
    title: Faker::Food.dish,
    summary: Faker::Hipster.paragraph,
    difficulty: "easy",
    prep_time: "30 min",
    instructions: Faker::Hipster.paragraph,
    category_id: Faker::Number.between(0,11),
    user_id: 2
    )
end

