require 'test_helper'

class PresentationEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @presentation_event = presentation_events(:one)
  end

  test "should get index" do
    get presentation_events_url
    assert_response :success
  end

  test "should get new" do
    get new_presentation_event_url
    assert_response :success
  end

  test "should create presentation_event" do
    assert_difference('PresentationEvent.count') do
      post presentation_events_url, params: { presentation_event: { event_name: @presentation_event.event_name } }
    end

    assert_redirected_to presentation_event_url(PresentationEvent.last)
  end

  test "should show presentation_event" do
    get presentation_event_url(@presentation_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_presentation_event_url(@presentation_event)
    assert_response :success
  end

  test "should update presentation_event" do
    patch presentation_event_url(@presentation_event), params: { presentation_event: { event_name: @presentation_event.event_name } }
    assert_redirected_to presentation_event_url(@presentation_event)
  end

  test "should destroy presentation_event" do
    assert_difference('PresentationEvent.count', -1) do
      delete presentation_event_url(@presentation_event)
    end

    assert_redirected_to presentation_events_url
  end
end
