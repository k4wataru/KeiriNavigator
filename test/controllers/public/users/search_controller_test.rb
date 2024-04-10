require "test_helper"

class Public::Users::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_users_search_index_url
    assert_response :success
  end

  test "should get results" do
    get public_users_search_results_url
    assert_response :success
  end
end
