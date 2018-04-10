require 'test_helper'

class HaikouillesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @haikouille = haikouilles(:one)
  end

  test "should get index" do
    get haikouilles_url
    assert_response :success
  end

  test "should get new" do
    get new_haikouille_url
    assert_response :success
  end

  test "should create haikouille" do
    assert_difference('Haikouille.count') do
      post haikouilles_url, params: { haikouille: { first: @haikouille.first, second: @haikouille.second, third: @haikouille.third, title: @haikouille.title } }
    end

    assert_redirected_to haikouille_url(Haikouille.last)
  end

  test "should show haikouille" do
    get haikouille_url(@haikouille)
    assert_response :success
  end

  test "should get edit" do
    get edit_haikouille_url(@haikouille)
    assert_response :success
  end

  test "should update haikouille" do
    patch haikouille_url(@haikouille), params: { haikouille: { first: @haikouille.first, second: @haikouille.second, third: @haikouille.third, title: @haikouille.title } }
    assert_redirected_to haikouille_url(@haikouille)
  end

  test "should destroy haikouille" do
    assert_difference('Haikouille.count', -1) do
      delete haikouille_url(@haikouille)
    end

    assert_redirected_to haikouilles_url
  end
end
