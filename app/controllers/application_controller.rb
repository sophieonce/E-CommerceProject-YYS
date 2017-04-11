class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  # Create cart session hash
  def cart
  session[:cart] ||= {}
  end
end
