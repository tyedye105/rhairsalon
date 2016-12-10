require('sinatra')
require('sinatra/reloader')
require('pry')
require('pg')
require('./lib/train')
require('./lib/city')
require('capybara')
also_reload('lib/**/*.rb')

get('/') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end
