require "application_system_test_case"

class ReviewersTest < ApplicationSystemTestCase
  setup do
    @reviewer = reviewers(:one)
  end

  test "visiting the index" do
    visit reviewers_url
    assert_selector "h1", text: "Reviewers"
  end

  test "should create reviewer" do
    visit reviewers_url
    click_on "New reviewer"

    click_on "Create Reviewer"

    assert_text "Reviewer was successfully created"
    click_on "Back"
  end

  test "should update Reviewer" do
    visit reviewer_url(@reviewer)
    click_on "Edit this reviewer", match: :first

    click_on "Update Reviewer"

    assert_text "Reviewer was successfully updated"
    click_on "Back"
  end

  test "should destroy Reviewer" do
    visit reviewer_url(@reviewer)
    click_on "Destroy this reviewer", match: :first

    assert_text "Reviewer was successfully destroyed"
  end
end
