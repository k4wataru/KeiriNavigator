require "test_helper"

class Public::Users::FollowersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_users_followers_index_url
    assert_response :success
  end
end
