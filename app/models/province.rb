class Province < ApplicationRecord
    validates :name, :pst, :hst, presence: true
end
