class AddressesController < ApplicationController
  before_filter :authorize

    def new
    @address = Address.new
    end

    def create
      @address = Address.new(address_params)



      if @address.save
        flash[:notice] = "You Address has been added!"
        redirect_to :back
      else
        render :new #render the view assocaited with new action of
      end
    end


    private
    def address_params
      params.require(:address).permit(:firstname,:lastname,:address,:city,:country,:customer_id,:province_id)
    end
    
end
