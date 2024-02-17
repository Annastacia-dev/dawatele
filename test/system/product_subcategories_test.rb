require "application_system_test_case"

class ProductSubcategoriesTest < ApplicationSystemTestCase
  setup do
    @product_subcategory = product_subcategories(:one)
  end

  test "visiting the index" do
    visit product_subcategories_url
    assert_selector "h1", text: "Product subcategories"
  end

  test "should create product subcategory" do
    visit product_subcategories_url
    click_on "New product subcategory"

    click_on "Create Product subcategory"

    assert_text "Product subcategory was successfully created"
    click_on "Back"
  end

  test "should update Product subcategory" do
    visit product_subcategory_url(@product_subcategory)
    click_on "Edit this product subcategory", match: :first

    click_on "Update Product subcategory"

    assert_text "Product subcategory was successfully updated"
    click_on "Back"
  end

  test "should destroy Product subcategory" do
    visit product_subcategory_url(@product_subcategory)
    click_on "Destroy this product subcategory", match: :first

    assert_text "Product subcategory was successfully destroyed"
  end
end
