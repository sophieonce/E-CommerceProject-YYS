class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end
  helper_method :current_user

   def authorize
   redirect_to '/login' unless current_user
   end

  # Create cart session hash
  def cart
  session[:cart] ||= {}
  end
end
