require "application_system_test_case"

class DishesTest < ApplicationSystemTestCase
  setup do
    @dish = dishes(:one)
  end

  test "visiting the index" do
    visit dishes_url
    assert_selector "h1", text: "Dishes"
  end

  test "should create dish" do
    visit dishes_url
    click_on "New dish"

    fill_in "Avg rating", with: @dish.avg_rating
    fill_in "Category", with: @dish.category
    fill_in "Imgs", with: @dish.imgs
    fill_in "Name", with: @dish.name
    fill_in "Number of reviews", with: @dish.number_of_reviews
    fill_in "Price", with: @dish.price
    click_on "Create Dish"

    assert_text "Dish was successfully created"
    click_on "Back"
  end

  test "should update Dish" do
    visit dish_url(@dish)
    click_on "Edit this dish", match: :first

    fill_in "Avg rating", with: @dish.avg_rating
    fill_in "Category", with: @dish.category
    fill_in "Imgs", with: @dish.imgs
    fill_in "Name", with: @dish.name
    fill_in "Number of reviews", with: @dish.number_of_reviews
    fill_in "Price", with: @dish.price
    click_on "Update Dish"

    assert_text "Dish was successfully updated"
    click_on "Back"
  end

  test "should destroy Dish" do
    visit dish_url(@dish)
    click_on "Destroy this dish", match: :first

    assert_text "Dish was successfully destroyed"
  end
end
