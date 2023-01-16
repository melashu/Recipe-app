class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    if @all_recipes.present?
      @all_recipes
    else
      @all_recipes = current_user.recipes.includes(:foods)
    end
  end

  def show
    if @recipe.present?
      @recipe_food
    else
      @recipe = current_user.recipes.includes(:foods).find(params[:id])
      #  @recipe_food=  RecipeFood.includes(:food).where(recipe_id:params[:id])
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = current_user.id
    if recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully!'
    else
      render :new, status: 422
    end
  end

  def destroy
    recipe = current_user.recipes.find(params[:id])
    if recipe.destroy
      redirect_to recipes_path, notice: 'Recipe deleted successfully!'
    else
      redirect_to recipes_path, alert: 'Unable to delete recipe!'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
