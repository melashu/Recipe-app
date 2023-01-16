require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user1 = User.create(name: 'John', email: 'recipe1@example.com', password: 'password1',
                         password_confirmation: 'password1')
    @recipe = Recipe.create(name: 'Pizza', preparation_time: 10, cooking_time: 20, description: 'good',
                            public: true, user_id: @user1.id)
  end

  it 'Should have a name' do
    expect(@recipe.name).to eq('Pizza')
  end

  it 'Should have a description' do
    expect(@recipe.description).to eq('good')
  end

  it 'Should have a preparation_time' do
    expect(@recipe.preparation_time).to eq(10)
  end
  it 'Should have a cooking_time' do
    expect(@recipe.cooking_time).to eq(20)
  end

  it 'Should have a public' do
    expect(@recipe.public).to eq(true)
  end
end
