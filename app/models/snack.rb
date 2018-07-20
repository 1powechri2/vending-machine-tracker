class Snack < ApplicationRecord
  has_many :vending_machine_snacks
  has_many :machines, through: :vending_machine_snacks

  def self.average_price
    average(:price)
  end
end
