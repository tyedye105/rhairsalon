class Stylist

attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes[:id]

  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylist = []
    returned_stylists.each() do |stylist|
      name = name.fetch("name")
      stylist.push(Stylist.new({:name => name}))
    end
    stylist
  end
end
