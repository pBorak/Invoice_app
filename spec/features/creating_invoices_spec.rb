require 'rails_helper'

RSpec.feature 'Create invoice', type: :feature do

  scenario 'Not logged in user try to create invoice ' do
    visit new_invoice_path
    have_current_path(new_user_session_path)
    expect(page).to have_text("You need to sign in or sign up before continuing.")
  end

  scenario 'Logged in valid inputs' do
    user = create(:user)
    login_as(user)
    visit new_invoice_path
    fill_in "Amount", with: 10000
    fill_in "From", with: "Random"
    fill_in "To", with: "Example"
    fill_in "Currency", with: "$"
    fill_in "Date", with: Date.tomorrow
    expect {
      click_button "Submit payment"
    }.to change(Invoice, :count).by(1)
    expect(page).to have_text("Invoice was successfully created.")
  end

  scenario 'Logged in invalid inputs' do
    user = create(:user)
    login_as(user)
    visit new_invoice_path
    fill_in "Amount", with: -5
    fill_in "From", with: "Company"
    fill_in "To", with: "Contargent"
    fill_in "Currency", with: "$"
    fill_in "Date", with: Date.yesterday
    click_button "Submit payment"
    expect(page).to have_text("Date can't be in the past")
    expect(page).to have_text("Amount must be greater than 0")
  end
end