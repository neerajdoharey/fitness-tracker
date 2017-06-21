require 'test_helper'

class BodyStatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get body_stats_index_url
    assert_response :success
  end

end
