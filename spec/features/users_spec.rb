require 'rails_helper'

feature "Users page" do

  scenario "visit" do
    visit "/"

    expect(page).to have_css "h1", text: "Listing users"
    expect(page).to have_css "table", id: "users"
    expect(page).to have_css "a", text: "New User"
  end

end
