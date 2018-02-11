require 'test_helper'

class PostpictsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postpict = postpicts(:one)
  end

  test "should get index" do
    get postpicts_url
    assert_response :success
  end

  test "should get new" do
    get new_postpict_url
    assert_response :success
  end

  test "should create postpict" do
    assert_difference('Postpict.count') do
      post postpicts_url, params: { postpict: { caption: @postpict.caption, image: @postpict.image } }
    end

    assert_redirected_to postpict_url(Postpict.last)
  end

  test "should show postpict" do
    get postpict_url(@postpict)
    assert_response :success
  end

  test "should get edit" do
    get edit_postpict_url(@postpict)
    assert_response :success
  end

  test "should update postpict" do
    patch postpict_url(@postpict), params: { postpict: { caption: @postpict.caption, image: @postpict.image } }
    assert_redirected_to postpict_url(@postpict)
  end

  test "should destroy postpict" do
    assert_difference('Postpict.count', -1) do
      delete postpict_url(@postpict)
    end

    assert_redirected_to postpicts_url
  end
end
