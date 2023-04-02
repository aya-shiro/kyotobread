require "test_helper"

class User::TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_topics_index_url
    assert_response :success
  end

  test "should get show" do
    get user_topics_show_url
    assert_response :success
  end
end
