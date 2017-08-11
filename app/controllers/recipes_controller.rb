class RecipesController < ApplicationController
  include RecipesHelper

  def index
    @recipes = Recipe.all
    if params[:search]
      @recipes = Recipe.search(params[:search]).order("created_at DESC")
    else
      @recipes = Recipe.all.order("created_at DESC")
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if owns_recipe(current_user, @recipe)
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    all = params[:recipe_ingredients][:recipe_ingredients]
    all.each do |stat|
      @ingredient = Ingredient.find_or_create_by(name: stat[:ingredient])
      @metric = Metric.find(stat[:metric])
      @amount = Amount.find_or_create_by(number: stat[:amount])
      next unless @recipe.save
      @recipe.recipe_ingredients.create(
        ingredient: @ingredient,
        metric: @metric,
        amount: @amount
        )
    end
    if @recipe.save
      redirect_to @recipe
    else
      render action: 'new'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if owns_recipe(current_user, @recipe)
      if @recipe.update(params[:recipe])
        redirect_to @recipe
      else
        render action: 'edit'
      end
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    raise ActionController::RoutingError.new('Not Found') if !owns_recipe(current_user, @recipe)
    @recipe.destroy
    current_user.favorites.each do |favorite|
      favorite.destroy if favorite.recipe.nil?
    end
    redirect_to current_user
  else
  end

  def toggle_favorite
    @recipe = Recipe.find(params[:id])
    @user = current_user

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

  def add_rating
    @recipe = Recipe.find(params[:id])
    if current_user
      found_rating = Rating.all.find_by(user_id: current_user.id, recipe_id: @recipe.id)
      if found_rating
        found_rating.value = params[:vote]
        found_rating.save
      else
        rating = Rating.new(rating_params)
        current_user.ratings << rating && @recipe.ratings << rating
      end
    else
      redirect_to new_user_session
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :summary, :difficulty, :prep_time, :instructions, :category_id, :user_id)
  end

  def recipe_ingredients_params
    params.require(:recipe_ingredients).permit(:ingredient, :amount, :metric)
  end

  def rating_params
    params.require(:rating).permit(:value)
  end

end
