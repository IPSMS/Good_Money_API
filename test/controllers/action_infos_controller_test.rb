require 'test_helper'

class ActionInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @action_info = action_infos(:one)
  end

  test "should get index" do
    get action_infos_url, as: :json
    assert_response :success
  end

  test "should create action_info" do
    assert_difference('ActionInfo.count') do
      post action_infos_url, params: { action_info: { amount: @action_info.amount, name: @action_info.name, stat_id: @action_info.stat_id, user_id: @action_info.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show action_info" do
    get action_info_url(@action_info), as: :json
    assert_response :success
  end

  test "should update action_info" do
    patch action_info_url(@action_info), params: { action_info: { amount: @action_info.amount, name: @action_info.name, stat_id: @action_info.stat_id, user_id: @action_info.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy action_info" do
    assert_difference('ActionInfo.count', -1) do
      delete action_info_url(@action_info), as: :json
    end

    assert_response 204
  end
end
