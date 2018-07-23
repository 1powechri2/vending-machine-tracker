require 'rails_helper'

describe Snack do
  describe 'Relationships' do
    it {should have_many (:vending_machine_snacks)}
    it {should have_many(:machines).through(:vending_machine_snacks)}
  end
end
