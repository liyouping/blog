require 'test_helper'

class WxUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wx_user = wx_users(:one)
  end

  test "should get index" do
    get wx_users_url
    assert_response :success
  end

  test "should get new" do
    get new_wx_user_url
    assert_response :success
  end

  test "should create wx_user" do
    assert_difference('WxUser.count') do
      post wx_users_url, params: { wx_user: { avatar_url: @wx_user.avatar_url, city: @wx_user.city, country: @wx_user.country, deleted_at: @wx_user.deleted_at, gender: @wx_user.gender, nick_name: @wx_user.nick_name, open_id: @wx_user.open_id, province: @wx_user.province } }
    end

    assert_redirected_to wx_user_url(WxUser.last)
  end

  test "should show wx_user" do
    get wx_user_url(@wx_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_wx_user_url(@wx_user)
    assert_response :success
  end

  test "should update wx_user" do
    patch wx_user_url(@wx_user), params: { wx_user: { avatar_url: @wx_user.avatar_url, city: @wx_user.city, country: @wx_user.country, deleted_at: @wx_user.deleted_at, gender: @wx_user.gender, nick_name: @wx_user.nick_name, open_id: @wx_user.open_id, province: @wx_user.province } }
    assert_redirected_to wx_user_url(@wx_user)
  end

  test "should destroy wx_user" do
    assert_difference('WxUser.count', -1) do
      delete wx_user_url(@wx_user)
    end

    assert_redirected_to wx_users_url
  end
end
