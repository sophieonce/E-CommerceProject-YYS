class OrdersController < ApplicationController

  def new
    @cart = cart
    @order = Order.new
    subtotal = 0
    cart.each do |cart_id, qty|
    product = Product.find(cart_id.to_i())
    subtotal = subtotal + product.price * qty
    end

    province_id = current_user.addresses.first.province_id
    province = Province.find(province_id)
    tax_rate = province.pst +  province.hst + 0.05

    total = subtotal * ( 1 + tax_rate )

    @amount = total * 100
    @description = "YYS"

  end

  def create
    # Amount in cents
    subtotal = 0
    cart.each do |cart_id, qty|
    product = Product.find(cart_id.to_i())
    subtotal = subtotal + product.price * qty
    end

    province_id = current_user.addresses.first.province_id
    province = Province.find(province_id)
    tax_rate = province.pst +  province.hst + 0.05

    total = subtotal * ( 1 + tax_rate )

    amount = (total * 100).floor

    @customer = Stripe::Customer.create(:email => params[:stripeEmail],
                                        :source  => params[:stripeToken])

    @charge = Stripe::Charge.create(:customer    => @customer.id,
                                    :amount      => amount,
                                    :description => 'Rails Stripe customer',
                                    :currency    => 'cad')

   reference = "Customer Id:" + @customer.id.to_s +  " Source:" + params[:stripeToken]
   if @charge.paid && @charge.amount == amount
    @order = Order.create( :status_id  => 1,
                           :total  => total,
                           :customer_id => current_user.id,
                           :stripe => reference)

     if @order.save
     cart.each do |cart_id, qty|
     product = Product.find(cart_id.to_i())
     LineItem.create( :price  => product.price,
                      :quantity => qty,
                      :order_id  => @order.id,
                      :product_id => product.id)
      session[:cart] = nil
      flash[:notice] = "Your Order has paid successfully, it will ship to you soon!"
      redirect_to '/'
     end
     else
       render :new
     end
   end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
