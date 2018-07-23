require 'rails_helper'

describe 'A user visits a snack show show page' do
  it 'sees a lot of snack data' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    owner = Owner.create(name: "Sam's Snacks")
    drwn  = owner.machines.create(location: "Darwin's Funk Chamber")

    snack_one   = Snack.create(name: "Cherry", price: 4)
    snack_two   = Snack.create(name: "Chocotines", price: 2)
    snack_three = Snack.create(name: "PB Cups", price: 4)
    snack_four  = Snack.create(name: "Sugar Blasts", price: 8)
    snack_five  = Snack.create(name: "McDingles", price: 2)

    stock_dons_1 = VendingMachineSnack.create(machine_id: dons.id, snack_id: snack_one.id)
    stock_dons_2 = VendingMachineSnack.create(machine_id: dons.id, snack_id: snack_two.id)
    stock_dons_3 = VendingMachineSnack.create(machine_id: dons.id, snack_id: snack_three.id)
    stock_dons_4 = VendingMachineSnack.create(machine_id: dons.id, snack_id: snack_five.id)

    stock_darwins_1 = VendingMachineSnack.create(machine_id: drwn.id, snack_id: snack_four.id)
    stock_darwins_2 = VendingMachineSnack.create(machine_id: drwn.id, snack_id: snack_five.id)

    average_price_dons = (dons.snacks.average(:price))
    average_price_drwn = (drwn.snacks.average(:price))

    count_dons = (dons.snacks.count)
    count_drwn = (drwn.snacks.count)

    visit snack_path(snack_five)

    expect(page).to have_content(snack_five.name)
    expect(page).to have_content(snack_five.price)
    expect(page).to have_content(dons.location)
    expect(page).to have_content(drwn.location)
    expect(page).to have_content(average_price_dons)
    expect(page).to have_content(average_price_drwn)
    expect(page).to have_content(count_dons)
    expect(page).to have_content(count_drwn)
  end
end
