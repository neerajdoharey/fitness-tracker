require 'test_helper'

class DietPlanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diet_plan_index_url
    assert_response :success
  end

end
