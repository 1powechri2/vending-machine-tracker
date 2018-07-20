describe 'Vending machine page' do
  context 'A user' do
    it 'visits a specific vending machine page and sees all snack for that machine' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_one = dons.snacks.create(name: "Cherry", price: 1)
      snack_two = dons.snacks.create(name: "Choco", price: 2)

      visit machine_path(dons)

      expect(page).to have_content("Snack: #{snack_one.name}")
      expect(page).to have_content("Price: #{snack_one.price}")
      expect(page).to have_content("Snack: #{snack_one.name}")
      expect(page).to have_content("Price: #{snack_one.price}")
    end
    it 'visits a specific vending machine page and sees an average price for all snacks' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_one = dons.snacks.create(name: "Cherry", price: 4)
      snack_two = dons.snacks.create(name: "Choco", price: 2)

      average_price = (snack_one.price + snack_two.price ) / 2

      visit machine_path(dons)

      expect(page).to have_content("Average Price of Snacks #{average_price}")
    end
  end
end
