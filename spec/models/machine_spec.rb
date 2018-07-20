require 'rails_helper'

describe Machine do
  describe 'Relationships' do
    it {should have_many(:vending_machine_snacks)}
    it {should have_many(:snacks).through(:vending_machine_snacks)}
  end
end
