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

post('/stylists') do
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

get('/stylists/:id/edit') do
    @stylist = Stylist.find(params.fetch('id').to_i)
    erb(:stylist_edit)
  end

delete('/stylists/:id/delete') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  @stylist.delete()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

patch('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  change_to = params.fetch('name_change')
  @stylist.update({:name => change_to})
  erb(:stylist_id)
end

get('/add_client') do
  erb(:add_clientform)
end

get('/stylists/:id/assign_client') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  @clients = Client.all()
  erb(:add_client_to_stylist)
end

post('/stylists/:id/clients') do
  @stylists = Stylist.find(params.fetch('id').to_i)

end
post('/client') do
  name = params.fetch('client_name')
  new_client = Client.new({:name => name, :stylist_id =>  0})
  new_client.save()
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:index)
end
