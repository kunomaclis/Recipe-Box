# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'Faker'

User.create!(
    email: "testing@testing.com",
    password: "password"
    )

ingredient = Ingredient.create!(name: "carrot")
metric = Metric.create!(name: "oz")
amount = Amount.create!(number: 3)

Category.create!(name: "Breakfast")
Category.create!(name: "Lunch")
Category.create!(name: "Dinner")
Category.create!(name: "Dessert")
Category.create!(name: "Smoothies")
Category.create!(name: "Cocktails")
Category.create!(name: "Appetizers")
Category.create!(name: "Vegan")
Category.create!(name: "Vegetarian")


5.times do
  Recipe.create!(
    title: Faker::Food.dish,
    summary: Faker::Hipster.paragraph,
    difficulty: "easy",
    prep_time: "30 min",
    instructions: Faker::Hipster.paragraph,
    category_id: 1,
    user_id: 1
    )
end



recipe_ingredients = Recipe.first.recipe_ingredients.new
recipe_ingredients.metric = metric
recipe_ingredients.amount = amount
recipe_ingredients.ingredient = ingredient
recipe_ingredients.save

