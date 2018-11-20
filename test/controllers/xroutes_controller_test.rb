require 'test_helper'

class XroutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @xroute = xroutes(:one)
  end

  test "should get index" do
    get xroutes_url
    assert_response :success
  end

  test "should get new" do
    get new_xroute_url
    assert_response :success
  end

  test "should create xroute" do
    assert_difference('Xroute.count') do
      post xroutes_url, params: { xroute: { city_id: @xroute.city_id, distance: @xroute.distance, hub_id: @xroute.hub_id, max_num_pas: @xroute.max_num_pas, operating_cost: @xroute.operating_cost } }
    end

    assert_redirected_to xroute_url(Xroute.last)
  end

  test "should show xroute" do
    get xroute_url(@xroute)
    assert_response :success
  end

  test "should get edit" do
    get edit_xroute_url(@xroute)
    assert_response :success
  end

  test "should update xroute" do
    patch xroute_url(@xroute), params: { xroute: { city_id: @xroute.city_id, distance: @xroute.distance, hub_id: @xroute.hub_id, max_num_pas: @xroute.max_num_pas, operating_cost: @xroute.operating_cost } }
    assert_redirected_to xroute_url(@xroute)
  end

  test "should destroy xroute" do
    assert_difference('Xroute.count', -1) do
      delete xroute_url(@xroute)
    end

    assert_redirected_to xroutes_url
  end
end
