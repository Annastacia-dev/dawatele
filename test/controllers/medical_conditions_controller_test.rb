require "test_helper"

class MedicalConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_condition = medical_conditions(:one)
  end

  test "should get index" do
    get medical_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_medical_condition_url
    assert_response :success
  end

  test "should create medical_condition" do
    assert_difference("MedicalCondition.count") do
      post medical_conditions_url, params: { medical_condition: {  } }
    end

    assert_redirected_to medical_condition_url(MedicalCondition.last)
  end

  test "should show medical_condition" do
    get medical_condition_url(@medical_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_medical_condition_url(@medical_condition)
    assert_response :success
  end

  test "should update medical_condition" do
    patch medical_condition_url(@medical_condition), params: { medical_condition: {  } }
    assert_redirected_to medical_condition_url(@medical_condition)
  end

  test "should destroy medical_condition" do
    assert_difference("MedicalCondition.count", -1) do
      delete medical_condition_url(@medical_condition)
    end

    assert_redirected_to medical_conditions_url
  end
end
