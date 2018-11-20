require "application_system_test_case"

class SchedulesTest < ApplicationSystemTestCase
  setup do
    @schedule = schedules(:one)
  end

  test "visiting the index" do
    visit schedules_url
    assert_selector "h1", text: "Schedules"
  end

  test "creating a Schedule" do
    visit schedules_url
    click_on "New Schedule"

    fill_in "Duration", with: @schedule.duration
    fill_in "Plane", with: @schedule.plane_id
    fill_in "Ta1", with: @schedule.ta1
    fill_in "Ta2", with: @schedule.ta2
    fill_in "Td1", with: @schedule.td1
    fill_in "Td2", with: @schedule.td2
    fill_in "Xroute", with: @schedule.xroute_id
    click_on "Create Schedule"

    assert_text "Schedule was successfully created"
    click_on "Back"
  end

  test "updating a Schedule" do
    visit schedules_url
    click_on "Edit", match: :first

    fill_in "Duration", with: @schedule.duration
    fill_in "Plane", with: @schedule.plane_id
    fill_in "Ta1", with: @schedule.ta1
    fill_in "Ta2", with: @schedule.ta2
    fill_in "Td1", with: @schedule.td1
    fill_in "Td2", with: @schedule.td2
    fill_in "Xroute", with: @schedule.xroute_id
    click_on "Update Schedule"

    assert_text "Schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Schedule" do
    visit schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Schedule was successfully destroyed"
  end
end
