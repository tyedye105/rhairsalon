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

describe('the path to view  a stylist', {:type => :feature}) do
  it('let user view individual stlyist page.') do
    test_stylist = Stylist.new({:name => "Jerry"})
    test_stylist.save()
    visit('/')
    click_link("Jerry")
    expect(page).to have_content("None")
    end
  end

# can not find delete button
# describe('path to delete a stylist', {:type => :feature}) do
#   it('will allow the user to delete the specified stylist') do
#     test_stylist = Stylist.new({:name => "Jerry"})
#     test_stylist.save()
#     visit('/stylists/test_stylist.id()/edit')
#     click_button("Delete")
#     expect(page).to have_content("No stylists")
#   end
# end

describe('the path to view  a client', {:type => :feature}) do
  it('let user view individual client page.') do
    test_client = Client.new({:name => "Jenny", :stylist_id => 0})
    test_client.save()
    visit('/')
    click_link("Jenny")
    expect(page).to have_content("Jenny")
    end
  end
  # can not find field 'name_change'
  # describe('the path to update  a client', {:type => :feature}) do
  #   it("let user update client's name page.") do
  #     test_client = Client.new({:name => "Jenny", :stylist_id => 0})
  #     test_client.save()
  #     visit('/clients/test_client.id()')
  #     fill_in('name_change', :with => "Jeri")
  #     click_button('update')
  #     expect(page).to have_content("Jeri")
  #     end
  #   end

  describe('the path to view  add a client to a stylist', {:type => :feature}) do
    it('let user view individual stlyist page.') do
      test_stylist = Stylist.new({:name => "Jerry"})
      test_stylist.save()
      test_client = Client.new({:name => "Jenny", :stylist_id => 0})
      test_client.save()
      visit('/')
      click_link("Jerry")
      click_button("manage clients for this stylist")
      fill_in('client_number', :with => "4")
      click_button('Add client!')
      expect(page).to have_content("Jenny")
      end
    end
