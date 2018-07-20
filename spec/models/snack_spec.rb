require 'rails_helper'

describe Snack do
  describe 'Relationships' do
    it {should have_many (:vending_machine_snacks)}
    it {should have_many(:machines).through(:vending_machine_snacks)}
  end
  describe 'class methods' do
    it 'can find an average price for all snacks' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_one = dons.snacks.create(name: "Cherry", price: 4)
      snack_two = dons.snacks.create(name: "Choco", price: 2)

      expect(Snack.average_price).to eq(3)
    end
  end
end
