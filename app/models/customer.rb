class Customer < ApplicationRecord
  belongs_to :province
  has_many :addresses
  
  has_secure_password

  validates :name,:password_digest, presence: true
end
