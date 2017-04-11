class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = Product.where(:category_id => @category.id).order(:name).page(params[:page]).per(5)
  end
end
