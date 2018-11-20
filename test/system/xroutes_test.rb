require "application_system_test_case"

class XroutesTest < ApplicationSystemTestCase
  setup do
    @xroute = xroutes(:one)
  end

  test "visiting the index" do
    visit xroutes_url
    assert_selector "h1", text: "Xroutes"
  end

  test "creating a Xroute" do
    visit xroutes_url
    click_on "New Xroute"

    fill_in "City", with: @xroute.city_id
    fill_in "Distance", with: @xroute.distance
    fill_in "Hub", with: @xroute.hub_id
    fill_in "Max Num Pas", with: @xroute.max_num_pas
    fill_in "Operating Cost", with: @xroute.operating_cost
    click_on "Create Xroute"

    assert_text "Xroute was successfully created"
    click_on "Back"
  end

  test "updating a Xroute" do
    visit xroutes_url
    click_on "Edit", match: :first

    fill_in "City", with: @xroute.city_id
    fill_in "Distance", with: @xroute.distance
    fill_in "Hub", with: @xroute.hub_id
    fill_in "Max Num Pas", with: @xroute.max_num_pas
    fill_in "Operating Cost", with: @xroute.operating_cost
    click_on "Update Xroute"

    assert_text "Xroute was successfully updated"
    click_on "Back"
  end

  test "destroying a Xroute" do
    visit xroutes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Xroute was successfully destroyed"
  end
end
