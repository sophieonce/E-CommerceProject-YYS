class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page(params[:page]).per(10)
    if params[:search]
    @products = @products.search(params)
    else
    @products = Product.order(:name).page(params[:page]).per(10)
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
