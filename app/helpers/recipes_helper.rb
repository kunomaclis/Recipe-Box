module RecipesHelper

  def found_favorite(user, recipe)
   Favorite.find_by(user_id: user.id, recipe_id: recipe.id)
  end

end
