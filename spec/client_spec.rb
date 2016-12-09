require('spec_helper')

new_client1 = Client.new({:name => 'Tina', :id => nil})

describe('Client')do

  describe('#name') do
    it('will return the name of the stylist') do
      new_client1
      expect(new_client1.name()).to(eq("Tina"))
    end
  end

  describe('#id') do
    it('will return the id of the stylist') do
      new_client = Client.new({:name => 'Ralph', :id => 1})
      expect(new_client.id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      new_client1
      new_client2 = Client.new({:name => 'Tina', :id => nil})
      expect(new_client1).to(eq(new_client2))
  end
end

  describe('.all') do
    it('will return an empty array at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save a stylist to the database') do
      new_client1.save()
      expect(Client.all()).to(eq([new_client1]))
    end
  end

  describe('#delete') do
    it('will delete a stylist from the database') do
      new_client1.save()
      new_client2 = Client.new({:name => 'Tina', :id => nil})
      new_client2.save()
      new_client1.delete()
      expect(Client.all()).to(eq([new_client2]))
    end
  end

  describe('#update') do
    it('lets you update the stylist in the database') do
      new_client1.save()
      new_client1.update({:name => "Anna"})
      expect(new_client1.name()).to(eq("Anna"))
    end
  end

end
