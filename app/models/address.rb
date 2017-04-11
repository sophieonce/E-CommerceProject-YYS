class Address < ApplicationRecord
  belongs_to :customer
  belongs_to :province
end
