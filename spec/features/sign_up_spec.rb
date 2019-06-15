require 'rails_helper'

RSpec.feature 'User Sign up', type: :feature do
  scenario 'User visits the site first time and signs up' do
    visit root_path
    expect(page).to have_text("Sign up")
    click_link 'Sign up'
    fill_in 'user[email]', with: Faker::Internet.email
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'Invalid inputs' do
    visit root_path
    expect(page).to have_text("Sign up")
    click_link 'Sign up'
    fill_in 'user[email]', with: 'invalid@c'
    fill_in 'user[password]', with: 'pass'
    fill_in 'user[password_confirmation]', with: 'pass'
    click_button 'Sign up'
    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Password is too short')
  end
end