class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # def how_many_food
  #   data = {}
  #   all_food = RecipeFood.all.includes(:food)

  #   all_food.each do |recipe_food|
  #    if data.has_key? recipe_food.food_id.to_s
  #      data[:quantity] += recipe_food.quantity
  #    else
  #      data[recipe_food.food_id.to_s] = recipe_food.food
  #      data[:quantity] = 0
  #    end
  #   end
  # data.size
  # end
end
