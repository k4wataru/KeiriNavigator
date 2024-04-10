require "test_helper"

class Public::Users::FollowingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_users_followings_index_url
    assert_response :success
  end
end
