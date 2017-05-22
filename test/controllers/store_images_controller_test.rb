require 'test_helper'

class StoreImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_image = store_images(:one)
  end

  test "should get index" do
    get store_images_url
    assert_response :success
  end

  test "should get new" do
    get new_store_image_url
    assert_response :success
  end

  test "should create store_image" do
    assert_difference('StoreImage.count') do
      post store_images_url, params: { store_image: { image_id: @store_image.image_id, position: @store_image.position, store_id: @store_image.store_id } }
    end

    assert_redirected_to store_image_url(StoreImage.last)
  end

  test "should show store_image" do
    get store_image_url(@store_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_image_url(@store_image)
    assert_response :success
  end

  test "should update store_image" do
    patch store_image_url(@store_image), params: { store_image: { image_id: @store_image.image_id, position: @store_image.position, store_id: @store_image.store_id } }
    assert_redirected_to store_image_url(@store_image)
  end

  test "should destroy store_image" do
    assert_difference('StoreImage.count', -1) do
      delete store_image_url(@store_image)
    end

    assert_redirected_to store_images_url
  end
end
