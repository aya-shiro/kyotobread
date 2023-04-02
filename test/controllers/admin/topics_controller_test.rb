require "test_helper"

class Admin::TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_topics_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_topics_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_topics_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_topics_destroy_url
    assert_response :success
  end
end
