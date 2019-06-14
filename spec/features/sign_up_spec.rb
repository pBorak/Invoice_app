require 'rails_helper'

RSpec.feature 'User Sign up', type: :feature do
  scenario 'User visits the site first time and signs up' do
    visit root_path
    expect(page).to have_text("Creating invoices it's not a magic! Sign up now, and see how easy it is!")
    expect(page).to have_link("Sign up")
    click_link 'Sign up'
    fill_in 'user[email]', with: Faker::Internet.email
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end