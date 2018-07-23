require 'rails_helper'

describe Machine do
  describe 'Relationships' do
    it {should have_many(:vending_machine_snacks)}
    it {should have_many(:snacks).through(:vending_machine_snacks)}
  end
  describe 'class methods' do
    it 'can find an average price for all snacks' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_one = Snack.create(name: "Cherry", price: 4)
      snack_two = Snack.create(name: "Choco", price: 2)
      stock_dons_1 = VendingMachineSnack.create(machine_id: dons.id, snack_id: snack_one.id)
      stock_dons_2 = VendingMachineSnack.create(machine_id: dons.id, snack_id: snack_two.id)

      expect(dons.average_price).to eq(3)
    end
  end
end
