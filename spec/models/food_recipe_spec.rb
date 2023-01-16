require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user1 = User.create(name: 'John', email: 'recipe1@example.com', password: 'password1',
                         password_confirmation: 'password1')
    @food1 = Food.create(name: 'Apple', user_id: @user1.id, measurement_unit: 'gram', price: 10, quantity: 1000)
    @recipe = Recipe.create(name: 'Pizza', preparation_time: 10, cooking_time: 20, description: 'good',
                            public: true, user_id: @user1.id)
    @recipe_food = RecipeFood.create(recipe_id: @recipe.id, food_id: @food1.id, quantity: 100)
  end

  it 'should have quantity' do
    expect(@recipe_food.quantity).to eq(100)
  end
end
