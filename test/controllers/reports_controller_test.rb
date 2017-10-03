require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get listing" do
    get reports_listing_url
    assert_response :success
  end

  test "should get customers" do
    get reports_customers_url
    assert_response :success
  end

  test "should get products" do
    get reports_products_url
    assert_response :success
  end

  test "should get sales" do
    get reports_sales_url
    assert_response :success
  end

end
