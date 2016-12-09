require('spec_helper')


new_stylist1 = Stylist.new({:name => 'Tina'})

describe('Stylist')do
  describe('#name') do
    it('will return the name of the stylist') do
      new_stylist1
      expect(new_stylist1.name()).to(eq("Tina"))
    end
  end
end
