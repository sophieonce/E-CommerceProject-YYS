class OrdersController < ApplicationController

  def new
    @cart = cart
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
    cart.each do |cart_id, qty|
    product = Product.find(cart_id.to_i())
    LineItem.create( :price  => product.price,
                     :quantity => qty,
                     :order_id  => @order.id,
                     :product_id => product.id)
    end

     session[:cart] = nil
      flash[:notice] = "Your Order has been places!"
      redirect_to '/'
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:total,:status_id,:customer_id)
  end



end
