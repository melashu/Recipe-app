class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
  validates :name, presence: true, length: { maximum: 255 }

  def price_calc
    total = 0
    foods.each do |food|
      total += food.price
    end
    total
  end

  def missed_food
    missed_foods = {}
    all_recipies = recipes.all.includes(:recipe_foods).includes(:foods)
    all_recipies.each do |all|
      all.recipe_foods.each do |recipe_food|
        if missed_foods.key? recipe_food.food.id.to_s
          missed_foods[recipe_food.food.id.to_s][:quantity] += recipe_food.quantity
        else
          quantity = recipe_food.quantity
          missed_foods[recipe_food.food.id.to_s] = { food: recipe_food.food, quantity: }
        end
      end
    end
    missed_foods
  end
end
