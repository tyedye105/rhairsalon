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

post('/stylist') do
  name = params.fetch('stylist_name')
  new_stylist = Stylist.new({:name => name})
  new_stylist.save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  @clients = Client.all()
  erb(:stylist_id)
end

get('/stylist/:id/edit') do
    @stylist = Stylist.find(params.fetch('id').to_i)
    erb(:stylist_edit)
  end

get('/add_client') do
  erb(:add_clientform)
end

post('/client') do
  name = params.fetch('client_name')
  new_client = Client.new({:name => name, :stylist_id =>  0})
  new_client.save()
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:index)
end
