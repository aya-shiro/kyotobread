require "test_helper"

class User::BreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_breads_index_url
    assert_response :success
  end

  test "should get show" do
    get user_breads_show_url
    assert_response :success
  end

  test "should get new" do
    get user_breads_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_breads_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get user_breads_destroy_url
    assert_response :success
  end
end
