require('capybara/rspec')
require('capybara')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

do('add stylist path.')
