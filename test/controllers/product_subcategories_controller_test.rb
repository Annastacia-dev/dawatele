require "test_helper"

class ProductSubcategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_subcategory = product_subcategories(:one)
  end

  test "should get index" do
    get product_subcategories_url
    assert_response :success
  end

  test "should get new" do
    get new_product_subcategory_url
    assert_response :success
  end

  test "should create product_subcategory" do
    assert_difference("ProductSubcategory.count") do
      post product_subcategories_url, params: { product_subcategory: {  } }
    end

    assert_redirected_to product_subcategory_url(ProductSubcategory.last)
  end

  test "should show product_subcategory" do
    get product_subcategory_url(@product_subcategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_subcategory_url(@product_subcategory)
    assert_response :success
  end

  test "should update product_subcategory" do
    patch product_subcategory_url(@product_subcategory), params: { product_subcategory: {  } }
    assert_redirected_to product_subcategory_url(@product_subcategory)
  end

  test "should destroy product_subcategory" do
    assert_difference("ProductSubcategory.count", -1) do
      delete product_subcategory_url(@product_subcategory)
    end

    assert_redirected_to product_subcategories_url
  end
end
