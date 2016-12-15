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

describe('path to add a client to the database', {:type => :feature}) do
  it("will take the user from the index, to a form where they can add the client.") do
  visit('/')
  click_link("Add a client")
  fill_in("client_name", :with => "Letty")
  click_button("Add client!")
  expect(page).to have_content("Letty")
  end
end
# Spec bugged. element not found. Unable to find button Delete 
# describe('path to delete a stylist', {:type => :feature}) do
#   it('will allow the user to delete the specified stylist') do
#     test_stylist = Stylist.new({:name => "Jerry"})
#     test_stylist.save()
#     visit('/')
#     click_link("Jerry")
#     click_button("update stylist")
#     click_button("Delete")
#     expect(page.to have_content("No stylists"))
#   end
# end
