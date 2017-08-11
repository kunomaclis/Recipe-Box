# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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


Recipe.create!(
    title: "The First Recipe Ever Made",
    summary: "Bacon ipsum dolor amet landjaeger ground round sausage, meatloaf ham leberkas frankfurter. Porchetta alcatra boudin, meatloaf cow chicken burgdoggen picanha jerky sausage short ribs tenderloin pork loin salami. Alcatra shank pork loin, andouille shoulder tail porchetta bresaola spare ribs turducken chicken. Beef ball tip frankfurter kevin, pork pork belly sausage ribeye filet mignon spare ribs cupim picanha capicola biltong fatback. Beef fatback ball tip, ham hock cow tongue tri-tip burgdoggen hamburger ground round pork loin turducken. Kevin ball tip pork chop bresaola shoulder shank.",
    difficulty: "easy",
    prep_time: "30 min",
    instructions: "Spicy jalapeno bacon ipsum dolor \n amet turducken eu kevin, dolore pariatur pastrami leberkas andouille ham \n hock brisket minim short ribs shankle hamburger. Pork pig salami irure. \n Turkey corned beef short loin ut, veniam minim exercitation biltong occaecat quis \n proident lorem salami filet mignon strip steak. Frankfurter ut beef ribs tail turkey. Enim consectetur \n flank capicola dolore sunt ball tip beef esse tail officia corned beef pork chop ut.",
    category_id: 1,
    user_id: 1
    )


Metric.create(name:"Cups")
Metric.create(name:"Pints")
Metric.create(name:"Quarts")
Metric.create(name:"Liters")
Metric.create(name:"Ounces")
Metric.create(name:"Grams")
Metric.create(name:"Teaspoons")
Metric.create(name:"Tablespoons")


recipe_ingredients = Recipe.first.recipe_ingredients.new
recipe_ingredients.metric = metric
recipe_ingredients.amount = amount
recipe_ingredients.ingredient = ingredient
recipe_ingredients.save

