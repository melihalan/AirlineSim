require "application_system_test_case"

class HubsTest < ApplicationSystemTestCase
  setup do
    @hub = hubs(:one)
  end

  test "visiting the index" do
    visit hubs_url
    assert_selector "h1", text: "Hubs"
  end

  test "creating a Hub" do
    visit hubs_url
    click_on "New Hub"

    fill_in "City", with: @hub.city_id
    fill_in "Office Cost", with: @hub.office_cost
    fill_in "Opening Cost", with: @hub.opening_cost
    fill_in "Rental Cost", with: @hub.rental_cost
    click_on "Create Hub"

    assert_text "Hub was successfully created"
    click_on "Back"
  end

  test "updating a Hub" do
    visit hubs_url
    click_on "Edit", match: :first

    fill_in "City", with: @hub.city_id
    fill_in "Office Cost", with: @hub.office_cost
    fill_in "Opening Cost", with: @hub.opening_cost
    fill_in "Rental Cost", with: @hub.rental_cost
    click_on "Update Hub"

    assert_text "Hub was successfully updated"
    click_on "Back"
  end

  test "destroying a Hub" do
    visit hubs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hub was successfully destroyed"
  end
end
