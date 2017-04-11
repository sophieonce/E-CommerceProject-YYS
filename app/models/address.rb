class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :province

  validates :firstname, :lastname, :address, :city, :country, presence: true
end
