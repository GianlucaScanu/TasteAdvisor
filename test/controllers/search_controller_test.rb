require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_index_url
    assert_response :success
  end

  test "should get show" do
    get search_show_url
    assert_response :success
  end

  test "should get edit" do
    get search_edit_url
    assert_response :success
  end

  test "should get update" do
    get search_update_url
    assert_response :success
  end

  test "should get search_restaurant" do
    get search_search_restaurant_url
    assert_response :success
  end

  test "should get search_dish" do
    get search_search_dish_url
    assert_response :success
  end
end
