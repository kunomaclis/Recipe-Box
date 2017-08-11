class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.all
    @favorites = @user.favorites
  end
  
end
