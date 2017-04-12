require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get orders_add_url
    assert_response :success
  end

end
