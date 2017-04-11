class Product < ApplicationRecord
  belongs_to :category
  validates :name,:price,:stock, presence: true
  mount_uploader :image, ImageUploader

def self.search(params)
   products = Product.where("name LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
   products = products.where("category_id = ?", params[:category_id]) if params[:category_id].present?
   products
 end

end
