require "test_helper"

class User::DrinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_drinks_index_url
    assert_response :success
  end
end
