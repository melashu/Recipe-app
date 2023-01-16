class PublicRecipesController < ApplicationController
  def index
    if @public_recipe.nil?
      @public_recipe = Recipe.all.includes(:foods).includes(:user).where(public: true)
    else
      @public_recipe
    end
  end

  def show
    if @recipe.present?
      @recipe
    else
      @recipe = Recipe.includes(:foods).includes(:user).find(params[:id])
    end
  end
end
