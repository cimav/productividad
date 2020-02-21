require "application_system_test_case"

class ConferencesTest < ApplicationSystemTestCase
  setup do
    @conference = conferences(:one)
  end

  test "visiting the index" do
    visit conferences_url
    assert_selector "h1", text: "Conferences"
  end

  test "creating a Conference" do
    visit conferences_url
    click_on "New Conference"

    fill_in "Country", with: @conference.country
    fill_in "End date", with: @conference.end_date
    fill_in "Is international", with: @conference.is_international
    fill_in "Is refereed", with: @conference.is_refereed
    fill_in "Name", with: @conference.name
    fill_in "Organizer", with: @conference.organizer
    fill_in "Place", with: @conference.place
    fill_in "Start date", with: @conference.start_date
    click_on "Create Conference"

    assert_text "Conference was successfully created"
    click_on "Back"
  end

  test "updating a Conference" do
    visit conferences_url
    click_on "Edit", match: :first

    fill_in "Country", with: @conference.country
    fill_in "End date", with: @conference.end_date
    fill_in "Is international", with: @conference.is_international
    fill_in "Is refereed", with: @conference.is_refereed
    fill_in "Name", with: @conference.name
    fill_in "Organizer", with: @conference.organizer
    fill_in "Place", with: @conference.place
    fill_in "Start date", with: @conference.start_date
    click_on "Update Conference"

    assert_text "Conference was successfully updated"
    click_on "Back"
  end

  test "destroying a Conference" do
    visit conferences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conference was successfully destroyed"
  end
end
