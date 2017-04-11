class SessionsController < ApplicationController

  def new
  end

  def create
    customer = Customer.find_by(name: params[:name])
    if customer and customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      flash[:notice] = "Login Successfully!"
      redirect_to '/'
    else
      flash[:notice] = "Invalid username or password!"
      redirect_to '/login'
    end
  end

  def destroy
    session[:customer_id] = nil
    flash[:notice] = "Logout Successfully!"
    redirect_to '/login'
  end

end
