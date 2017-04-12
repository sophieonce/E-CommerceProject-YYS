class CartsController < ApplicationController

    def index
      @cart = cart
    end

    def add
      id = params[:id]
      cart[id] ? cart[id] = cart[id] + 1 : cart[id] = 1
      flash[:notice] = "Added Successfully!"
      redirect_to :back
    end

# update cart quantity
    def update
      id = params[:id]
      if params[:commit] == '-'
        if(cart[id] > 1)
        cart[id] = cart[id] - 1
        else
        cart[id] = 1
       end
      redirect_to :back
      elsif params[:commit] == '+'
        cart[id] ? cart[id] = cart[id] + 1 : cart[id] = 1
        redirect_to :back
      end
    end

# remove product from shopping cart
    def destroy
    id = params[:id]
    session[:cart].delete(id)
    redirect_to action: :index
    end


# empty shopping cart
    def clearCart
      session[:cart] = nil
      redirect_to action: :index
    end
end
