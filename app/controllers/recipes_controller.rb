class RecipesController < ApplicationController
  # Create new recipe object
  # call .recipe_ingredients.new ON the new object
  # iterate through params given of ingredient form and assign to recipe_ingredients where correct!

  # Recipe.first.ingredient_recipes.includes(:ingredient, :metric, :amount).each {|x| p x.ingredient; p x.metric; p x.amount }
end
