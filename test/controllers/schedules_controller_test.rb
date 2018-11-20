require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_url
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post schedules_url, params: { schedule: { duration: @schedule.duration, plane_id: @schedule.plane_id, ta1: @schedule.ta1, ta2: @schedule.ta2, td1: @schedule.td1, td2: @schedule.td2, xroute_id: @schedule.xroute_id } }
    end

    assert_redirected_to schedule_url(Schedule.last)
  end

  test "should show schedule" do
    get schedule_url(@schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_url(@schedule)
    assert_response :success
  end

  test "should update schedule" do
    patch schedule_url(@schedule), params: { schedule: { duration: @schedule.duration, plane_id: @schedule.plane_id, ta1: @schedule.ta1, ta2: @schedule.ta2, td1: @schedule.td1, td2: @schedule.td2, xroute_id: @schedule.xroute_id } }
    assert_redirected_to schedule_url(@schedule)
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete schedule_url(@schedule)
    end

    assert_redirected_to schedules_url
  end
end
