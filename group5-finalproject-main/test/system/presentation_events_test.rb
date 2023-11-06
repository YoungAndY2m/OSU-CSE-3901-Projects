require "application_system_test_case"

class PresentationEventsTest < ApplicationSystemTestCase
  setup do
    @presentation_event = presentation_events(:one)
  end

  test "visiting the index" do
    visit presentation_events_url
    assert_selector "h1", text: "Presentation Events"
  end

  test "creating a Presentation event" do
    visit presentation_events_url
    click_on "New Presentation Event"

    fill_in "Event name", with: @presentation_event.event_name
    click_on "Create Presentation event"

    assert_text "Presentation event was successfully created"
    click_on "Back"
  end

  test "updating a Presentation event" do
    visit presentation_events_url
    click_on "Edit", match: :first

    fill_in "Event name", with: @presentation_event.event_name
    click_on "Update Presentation event"

    assert_text "Presentation event was successfully updated"
    click_on "Back"
  end

  test "destroying a Presentation event" do
    visit presentation_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Presentation event was successfully destroyed"
  end
end
