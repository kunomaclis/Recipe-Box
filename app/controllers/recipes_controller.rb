class RecipesController < ApplicationController
  include RecipesHelper

  def show
    @recipe = Recipe.find(params[:id])
  end

  def toggle_favorite
    @recipe = Recipe.find(params[:id])
    @user = current_user
    # Check if user has favored the recipe before
    if found_favorite(@user, @recipe)
      # remove
      found_favorite(@user, @recipe).destroy
      redirect_to @recipe
    else
      # add favorite
    @user.favorites.create(recipe: @recipe, user: @user)
    redirect_to @recipe
  end
  end
  # Create new recipe object
  # call .recipe_ingredients.new ON the new object
  # iterate through params given of ingredient form and assign to recipe_ingredients where correct!

  # Recipe.first.recipe_ingredients.includes(:ingredient, :metric, :amount).each {|x| p x.ingredient; p x.metric; p x.amount }
end


