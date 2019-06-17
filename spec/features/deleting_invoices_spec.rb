require 'rails_helper'

RSpec.feature 'Delete invoice', type: :feature do

  scenario 'User delete invoice', js: true do
    user = create(:user)
    create(:invoice, user: user)
    login_as(user)
    visit invoices_path
    expect {
      click_link "Destroy"
      page.driver.browser.switch_to.alert.accept
      sleep 1
    }.to change(Invoice, :count).by(-1)
  end
end