require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get weight" do
    get reports_weight_url
    assert_response :success
  end

  test "should get bodyfat" do
    get reports_bodyfat_url
    assert_response :success
  end

end
