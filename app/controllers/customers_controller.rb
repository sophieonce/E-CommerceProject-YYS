class CustomersController < ApplicationController

  def show
    @customer = find_customer
  end


  def new
  @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      flash[:notice] = "You account has been created!"
      redirect_to @customer
    else
      render :new #render the view assocaited with new action of
    end
  end


  private

  def find_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :password, :password_confirmation)
  end

end
