class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :status

  has_many :line_item
end
