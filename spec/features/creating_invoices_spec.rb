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
    fill_in "Company", with: "Random"
    fill_in "Contragent", with: "Example"
    fill_in "Currency", with: "$"
    page.find('#invoice_date_1i').select "2020"
    page.find('#invoice_date_2i').select "June"
    page.find('#invoice_date_3i').select "16"
    expect {
      click_button "Create Invoice"
    }.to change(Invoice, :count).by(1)
    expect(page).to have_text("Invoice was successfully created.")
  end

  scenario 'Logged in invalid inputs' do
    user = create(:user)
    login_as(user)
    visit new_invoice_path
    fill_in "Amount", with: -5
    fill_in "Company", with: "Company"
    fill_in "Contragent", with: "Contargent"
    fill_in "Currency", with: "$"
    page.find('#invoice_date_1i').select "2015"
    page.find('#invoice_date_2i').select "April"
    page.find('#invoice_date_3i').select "16"
    click_button "Create Invoice"
    expect(page).to have_text("Date can't be in the past")
    expect(page).to have_text("Amount must be greater than 0")
  end
end