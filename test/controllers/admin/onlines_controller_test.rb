require "test_helper"

class Admin::OnlinesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_onlines_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_onlines_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_onlines_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_onlines_destroy_url
    assert_response :success
  end
end
