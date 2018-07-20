require 'rails_helper'

describe VendingMachineSnack do
  describe 'Relationships' do
    it {should belong_to(:machine)}
    it {should belong_to(:snack)}
  end
end
