require "application_system_test_case"

class PlaneModelsTest < ApplicationSystemTestCase
  setup do
    @plane_model = plane_models(:one)
  end

  test "visiting the index" do
    visit plane_models_url
    assert_selector "h1", text: "Plane Models"
  end

  test "creating a Plane model" do
    visit plane_models_url
    click_on "New Plane Model"

    fill_in "Avg Speed", with: @plane_model.avg_speed
    fill_in "Cost", with: @plane_model.cost
    fill_in "Fuel Use", with: @plane_model.fuel_use
    fill_in "Hosts", with: @plane_model.hosts
    fill_in "Maintanence", with: @plane_model.maintanence
    fill_in "Max Pas", with: @plane_model.max_pas
    fill_in "Name", with: @plane_model.name
    fill_in "Pilots", with: @plane_model.pilots
    fill_in "Range", with: @plane_model.range
    click_on "Create Plane model"

    assert_text "Plane model was successfully created"
    click_on "Back"
  end

  test "updating a Plane model" do
    visit plane_models_url
    click_on "Edit", match: :first

    fill_in "Avg Speed", with: @plane_model.avg_speed
    fill_in "Cost", with: @plane_model.cost
    fill_in "Fuel Use", with: @plane_model.fuel_use
    fill_in "Hosts", with: @plane_model.hosts
    fill_in "Maintanence", with: @plane_model.maintanence
    fill_in "Max Pas", with: @plane_model.max_pas
    fill_in "Name", with: @plane_model.name
    fill_in "Pilots", with: @plane_model.pilots
    fill_in "Range", with: @plane_model.range
    click_on "Update Plane model"

    assert_text "Plane model was successfully updated"
    click_on "Back"
  end

  test "destroying a Plane model" do
    visit plane_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plane model was successfully destroyed"
  end
end
