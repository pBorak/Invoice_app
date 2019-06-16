require 'rails_helper'

RSpec.feature 'Update invoice', type: :feature do

  scenario 'Valid attribute' do
    user = create(:user)
    invoice = create(:invoice, user: user)
    login_as(user)
    visit edit_invoice_path(invoice)
    fill_in "Amount", with: 100001
    click_button "Update Invoice"
    expect(page).to have_text("Invoice was successfully updated.")
  end

  scenario 'Invalid attribute' do
    user = create(:user)
    invoice = create(:invoice, user: user)
    login_as(user)
    visit edit_invoice_path(invoice)
    fill_in "Amount", with: -1
    click_button "Update Invoice"
    expect(page).to have_text("Amount must be greater than 0")
  end

  scenario 'Other user try to update invoice ' do
    user = create(:user)
    invoice = create(:invoice, user: user)
    other_user = create(:user)
    login_as(other_user)
    visit edit_invoice_path(invoice)
    have_current_path(root_url)
  end



end