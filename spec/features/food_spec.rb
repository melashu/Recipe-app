require 'rails_helper'

describe 'Food', type: :feature do
  it 'Should redirect to user authentication page' do
    visit('/foods')
    expect(page).to have_content('Log in')
  end
end
