require "test_helper"

class Admin::DrinksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_drinks_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_drinks_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_drinks_edit_url
    assert_response :success
  end
end
