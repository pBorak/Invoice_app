require 'rails_helper'

RSpec.feature 'Log in', type: :feature do

  scenario 'valid inputs' do
    user = create(:user)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'invalid inputs' do
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'ivnalid@.com'
    fill_in 'Password', with: 'bad'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
  end

end