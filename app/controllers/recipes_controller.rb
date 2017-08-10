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

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    all = params[:recipe_ingredients][:recipe_ingredients]
    all.each do |stat|
      @ingredient = Ingredient.find_or_create_by(name: stat[:ingredient])
      @metric = Metric.find(stat[:metric])
      @amount = Amount.find_or_create_by(number: stat[:amount])



      if @recipe.save
        @recipe.recipe_ingredients.create(
          ingredient: @ingredient,
          metric: @metric,
          amount: @amount
          )
      end
    end
    if @recipe.save
      redirect_to @recipe
    else
      render :action => 'new'
    end
  end

end

def update
  @recipe = Recipe.find(params[:id])

  if @recipe.update(params[:recipe])
    redirect_to @recipe
  else
    render :action => 'edit'
  end
end

def destroy
end

private
def recipe_params
  params.require(:recipe).permit(:title, :summary, :difficulty, :prep_time, :instructions, :category_id, :user_id)
end

def recipe_ingredients_params
  params.require(:recipe_ingredients).permit(:ingredient, :amount, :metric)
end


