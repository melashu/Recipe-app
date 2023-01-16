class IngredientsController < ApplicationController
  def new
    @all_food = current_user.foods.all
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(ingredient_params)
    @recipe_food.recipe_id = params[:recipe_id]

    if @recipe_food.save
      redirect_to recipe_path(params[:recipe_id]), notice: 'Successfully created ingredient'
    else
      render :new, status: 422
    end
  end

  def destroy
    recipe = RecipeFood.find(params[:id])
    if recipe.destroy
      redirect_to recipe_path(params[:recipe_id]), notice: 'Ingredient deleted successfully!'
    else
      redirect_to recipes_path, alert: 'Unable to delete ingredient!'
    end
  end

  private

  def ingredient_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
