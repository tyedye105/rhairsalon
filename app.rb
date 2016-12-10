require('sinatra')
require('sinatra/reloader')
require('pry')
require('pg')
require('./lib/stylist')
require('./lib/client')
require('capybara')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/add_stylist') do
  erb(:add_stylist)
end

post('/added_stylist') do
  name = params.fetch('stylist_name')
  new_stylist = Stylist.new({:name => name})
  new_stylist.save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/stylists/:id') do
  @stylists = Stylist.find(params.fetch('id').to_i)
  @clients = Client.all()
  erb(:stylist_id)
end
