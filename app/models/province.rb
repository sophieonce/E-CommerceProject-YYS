class Province < ApplicationRecord
    has_many :customers
    has_many :addresses
    validates :name, :pst, :hst, presence: true
end
