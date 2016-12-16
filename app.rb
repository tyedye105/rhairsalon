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


post('/stylists/:id/client_add') do
  client_id = params.fetch('client_number').to_i
  stylist_id = params.fetch('stylist_id').to_i
  DB.exec("UPDATE clients SET stylist_id = #{stylist_id} WHERE id = #{client_id}")
  @clients = Client.all()
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist_id)

end


post('/stylists/:id/client_remove') do
  client_id = params.fetch('client_number').to_i
  DB.exec("UPDATE clients SET stylist_id = #{0} WHERE id = #{client_id}")
  @clients = Client.all()
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist_id)

end




get('/stylists/:id/client_management') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  @clients = Client.all()
  erb(:add_client_to_stylist)
end

post('/client') do
  name = params.fetch('client_name')
  new_client = Client.new({:name => name, :stylist_id =>  0})
  new_client.save()
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:index)
end
