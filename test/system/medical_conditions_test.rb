require "application_system_test_case"

class MedicalConditionsTest < ApplicationSystemTestCase
  setup do
    @medical_condition = medical_conditions(:one)
  end

  test "visiting the index" do
    visit medical_conditions_url
    assert_selector "h1", text: "Medical conditions"
  end

  test "should create medical condition" do
    visit medical_conditions_url
    click_on "New medical condition"

    click_on "Create Medical condition"

    assert_text "Medical condition was successfully created"
    click_on "Back"
  end

  test "should update Medical condition" do
    visit medical_condition_url(@medical_condition)
    click_on "Edit this medical condition", match: :first

    click_on "Update Medical condition"

    assert_text "Medical condition was successfully updated"
    click_on "Back"
  end

  test "should destroy Medical condition" do
    visit medical_condition_url(@medical_condition)
    click_on "Destroy this medical condition", match: :first

    assert_text "Medical condition was successfully destroyed"
  end
end
