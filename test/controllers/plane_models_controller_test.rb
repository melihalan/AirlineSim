require 'test_helper'

class PlaneModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plane_model = plane_models(:one)
  end

  test "should get index" do
    get plane_models_url
    assert_response :success
  end

  test "should get new" do
    get new_plane_model_url
    assert_response :success
  end

  test "should create plane_model" do
    assert_difference('PlaneModel.count') do
      post plane_models_url, params: { plane_model: { avg_speed: @plane_model.avg_speed, cost: @plane_model.cost, fuel_use: @plane_model.fuel_use, hosts: @plane_model.hosts, maintanence: @plane_model.maintanence, max_pas: @plane_model.max_pas, name: @plane_model.name, pilots: @plane_model.pilots, range: @plane_model.range } }
    end

    assert_redirected_to plane_model_url(PlaneModel.last)
  end

  test "should show plane_model" do
    get plane_model_url(@plane_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_plane_model_url(@plane_model)
    assert_response :success
  end

  test "should update plane_model" do
    patch plane_model_url(@plane_model), params: { plane_model: { avg_speed: @plane_model.avg_speed, cost: @plane_model.cost, fuel_use: @plane_model.fuel_use, hosts: @plane_model.hosts, maintanence: @plane_model.maintanence, max_pas: @plane_model.max_pas, name: @plane_model.name, pilots: @plane_model.pilots, range: @plane_model.range } }
    assert_redirected_to plane_model_url(@plane_model)
  end

  test "should destroy plane_model" do
    assert_difference('PlaneModel.count', -1) do
      delete plane_model_url(@plane_model)
    end

    assert_redirected_to plane_models_url
  end
end
