require "test_helper"

class User::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get user_shops_show_url
    assert_response :success
  end
end
