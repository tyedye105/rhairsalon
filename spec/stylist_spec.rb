require('spec_helper')


new_stylist1 = Stylist.new({:name => 'Tina', :id =>nil})

describe('Stylist')do
  describe('#name') do
    it('will return the name of the stylist') do
      new_stylist1
      expect(new_stylist1.name()).to(eq("Tina"))
    end
  end

  describe('#id') do
    it('will return the id of the stylist') do
      new_stylist = Stylist.new({:name => 'Ralph', :id => nil})
      new_stylist.save()
      expect(new_stylist.id()).to(be_an_instance_of(Fixnum))
  end
end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      new_stylist1
      new_stylist2 = Stylist.new({:name => 'Tina', :id => nil})
      expect(new_stylist1).to(eq(new_stylist2))
  end
end

  describe('.all') do
    it('will return an empty array at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save a stylist to the database') do
      new_stylist1.save()
      expect(Stylist.all()).to(eq([new_stylist1]))
    end
  end

  describe('#delete') do
    it('will delete a stylist from the database') do
      new_stylist1.save()
      new_stylist2 = Stylist.new({:name => 'Tina', :id => nil})
      new_stylist2.save()
      new_stylist1.delete()
      expect(Stylist.all()).to(eq([new_stylist2]))
    end
  end

  describe('#update') do
    it('lets you update the stylist in the database') do
      new_stylist1.save()
      new_stylist1.update({:name => "Anna"})
      expect(new_stylist1.name()).to(eq("Anna"))
    end
    # it('will add a client to a stylist.') do
    # new_stylist1.save()
    # new_client = Client.new({:name => "Penny", :id => nil, :stylist_id => nil})
    # new_client.save()
    # new_stylist1.update({:client_ids => [new_client.id()]})
    # expect(new_stylist1.clients()).to(eq([new_client]))
    # end
  end

  describe('.find') do
    it('will find the stylist by id and return the asscoiated styllist from the database') do
      new_stylist1.save()
      new_stylist2 = Stylist.new({:name => 'Tina', :id => nil})
      new_stylist2.save()
      expect(Stylist.find(new_stylist2.id())).to(eq(new_stylist2))
    end
  end

  # describe('#clients') do
  #   it('will return all of the clients of a stylist') do
  #     new_stylist1.save()
  #     new_client = Client.new({:name => "Penny", :id => nil, :stylist_id => 1})
  #     new_client.save()
  #     new_stylist1.update({:client_ids => [new_client.id()]})
  #     expect(new_stylist1.clients()).to(eq([new_client]))
  #     end
  #   end
  end
