require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get bmi_calculator" do
    get calculator_bmi_calculator_url
    assert_response :success
  end

end
