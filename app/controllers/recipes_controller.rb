class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end
  # Create new recipe object
  # call .recipe_ingredients.new ON the new object
  # iterate through params given of ingredient form and assign to recipe_ingredients where correct!

  # Recipe.first.recipe_ingredients.includes(:ingredient, :metric, :amount).each {|x| p x.ingredient; p x.metric; p x.amount }
end

# <% @recipe.recipe_ingredients.includes(:ingredient, :metric, :amount).each do |x| %>
    # <li> <%= x.ingredient.name;%> </li>
    # <li> <%= x.metric.name; %> </li>
    # <li> <%= x.amount.number %> </li>

    # <%end%>
