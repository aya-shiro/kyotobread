require "test_helper"

class Admin::BreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_breads_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_breads_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_breads_destroy_url
    assert_response :success
  end
end
