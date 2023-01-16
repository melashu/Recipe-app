require 'rails_helper'

describe 'User', type: :feature do
  it 'Should redirect to user authentication page' do
    visit '/users/sign_in'
    expect(page).to have_button('Log in')
  end
end
