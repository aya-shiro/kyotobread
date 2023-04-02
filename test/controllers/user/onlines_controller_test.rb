require "test_helper"

class User::OnlinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_onlines_index_url
    assert_response :success
  end

  test "should get show" do
    get user_onlines_show_url
    assert_response :success
  end
end
