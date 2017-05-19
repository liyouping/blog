require 'test_helper'

class ApplyActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apply_activity = apply_activities(:one)
  end

  test "should get index" do
    get apply_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_apply_activity_url
    assert_response :success
  end

  test "should create apply_activity" do
    assert_difference('ApplyActivity.count') do
      post apply_activities_url, params: { apply_activity: { activity_id: @apply_activity.activity_id, open_id: @apply_activity.open_id } }
    end

    assert_redirected_to apply_activity_url(ApplyActivity.last)
  end

  test "should show apply_activity" do
    get apply_activity_url(@apply_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_apply_activity_url(@apply_activity)
    assert_response :success
  end

  test "should update apply_activity" do
    patch apply_activity_url(@apply_activity), params: { apply_activity: { activity_id: @apply_activity.activity_id, open_id: @apply_activity.open_id } }
    assert_redirected_to apply_activity_url(@apply_activity)
  end

  test "should destroy apply_activity" do
    assert_difference('ApplyActivity.count', -1) do
      delete apply_activity_url(@apply_activity)
    end

    assert_redirected_to apply_activities_url
  end
end
