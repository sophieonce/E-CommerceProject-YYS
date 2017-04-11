class Product < ApplicationRecord
  belongs_to :category
  validates :name,:price,:stock, presence: true
  

  mount_uploader :image, ImageUploader
end
