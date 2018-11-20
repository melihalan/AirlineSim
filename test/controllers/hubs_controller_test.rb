require 'test_helper'

class HubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hub = hubs(:one)
  end

  test "should get index" do
    get hubs_url
    assert_response :success
  end

  test "should get new" do
    get new_hub_url
    assert_response :success
  end

  test "should create hub" do
    assert_difference('Hub.count') do
      post hubs_url, params: { hub: { city_id: @hub.city_id, office_cost: @hub.office_cost, opening_cost: @hub.opening_cost, rental_cost: @hub.rental_cost } }
    end

    assert_redirected_to hub_url(Hub.last)
  end

  test "should show hub" do
    get hub_url(@hub)
    assert_response :success
  end

  test "should get edit" do
    get edit_hub_url(@hub)
    assert_response :success
  end

  test "should update hub" do
    patch hub_url(@hub), params: { hub: { city_id: @hub.city_id, office_cost: @hub.office_cost, opening_cost: @hub.opening_cost, rental_cost: @hub.rental_cost } }
    assert_redirected_to hub_url(@hub)
  end

  test "should destroy hub" do
    assert_difference('Hub.count', -1) do
      delete hub_url(@hub)
    end

    assert_redirected_to hubs_url
  end
end
