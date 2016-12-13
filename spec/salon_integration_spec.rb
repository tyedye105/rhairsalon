require('capybara/rspec')
require('capybara')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path to add a stylist to the database.', {:type => :feature}) do
  it('will take the user from the index, to the add stylist form, and back to the index with the inputed sylist appearing on the page.') do
    visit('/')
    click_link("Add a stylist")
    fill_in("stylist_name", :with => "Terra")
    click_button("Add stylist!")
    expect(page).to have_content("Terra")
  end
end
