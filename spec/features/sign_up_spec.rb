require 'rails_helper'

describe 'User', type: :feature do
  it 'Should signup successfuly' do
    visit '/users/sign_up'
    within('form') do
      fill_in 'Name', with: 'Melashu'
      fill_in 'Email', with: 'melashu@gmail.com'
      fill_in 'Password', with: '12345678'
    end
    click_button 'Sign up'
    expect(page).to have_content('Log in')
  end
end
