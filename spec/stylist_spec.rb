require('spec_helper')


new_stylist1 = Stylist.new({:name => 'Tina', :id => nil})

describe('Stylist')do
  describe('#name') do
    it('will return the name of the stylist') do
      new_stylist1
      expect(new_stylist1.name()).to(eq("Tina"))
    end
  end
  describe('#id') do
    it('will return the id of the stylist') do
      new_stylist = Stylist.new({:name => 'Ralph', :id => 1})
      expect(new_stylist.id()).to(eq(1))
    end
  end
  describe('.all') do
    it('will return an empty array at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end
end
