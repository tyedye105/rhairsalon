class Stylist

attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id]

  end

  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name())
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = ('#{@id}');")
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")

    # attributes.fetch(:client_ids, []).each() do |client_id|
    #   DB.exec("INSERT INTO clients (stylist_id) VALUES (#{@id});")
  end

  define_singleton_method(:find) do |search_id|
    found_stylist = nil
    Stylist.all().each do |stylist|
      if stylist.id() == (search_id)
        found_stylist = stylist
      end
    end
    found_stylist
  end
  # define_method(:clients) do
  #   clients = []
  #   results = DB.exec("SELECT id FROM clients WHERE stylist_id = #{self.id()};")
  #   results.each() do |result|
  #     client_id = result.fetch('id').to_i()
  #     client =  DB.exec("SELECT name FROM clients WHERE id = #{client_id};")
  #     name = client.first().fetch("name")
  #     clients.push(Client.new({:name => name, :id => client_id}))
  #   end
  #   clients
  # end
#
end
