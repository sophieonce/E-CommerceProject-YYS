class Customer < ApplicationRecord
  belongs_to :province
  has_secure_password
end
