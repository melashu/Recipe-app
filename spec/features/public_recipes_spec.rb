require 'rails_helper'

describe 'public recipes', type: :feature do
  before :all do
    user = User.create!(name: 'Melashu', email: 'dad20891@amare.com', password: '1234567')
    Recipe.create!(name: 'Pasta', preparation_time: 30, cooking_time: 50, description: 'Steps to follow',
                   public: true, user_id: user.id)
  end
  it 'Should shave' do
    visit 'public_recipes'

    expect(page).to have_content('By Melashu')
  end
end
