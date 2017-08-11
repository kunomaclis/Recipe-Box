class RecipesController < ApplicationController
  respond_to :html, :js

  include RecipesHelper

  def index
    #binding.pry
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
    if request.xhr?
      render partial: "ingredient_form"
    else
      @recipe
    end
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

    if @recipe.update_attributes(recipe_params)
      redirect_to @recipe
    else
      render action: 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    current_user.favorites.each do |favorite|
      favorite.destroy if favorite.recipe.nil?
    end
    redirect_to current_user
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

  def ingredient
    if request.xhr?
      render partial: "ingredient_form"
    else
      @recipe
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :summary, :difficulty, :prep_time, :instructions, :category_id, :user_id)
  end

  def recipe_ingredients_params
    params.require(:recipe_ingredients).permit(:ingredient, :amount, :metric)
  end


end
