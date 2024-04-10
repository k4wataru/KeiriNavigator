require "test_helper"

class Public::Posts::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_posts_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_posts_favorites_destroy_url
    assert_response :success
  end
end
