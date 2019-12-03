require "application_system_test_case"

class JournalsTest < ApplicationSystemTestCase
  setup do
    @journal = journals(:one)
  end

  test "visiting the index" do
    visit journals_url
    assert_selector "h1", text: "Journals"
  end

  test "creating a Journal" do
    visit journals_url
    click_on "New Journal"

    fill_in "Country", with: @journal.country_id
    fill_in "E issn", with: @journal.e_issn
    check "Is indexed" if @journal.is_indexed
    check "Is international" if @journal.is_international
    check "Is refereed" if @journal.is_refereed
    fill_in "Issn", with: @journal.issn
    fill_in "Name", with: @journal.name
    fill_in "Website", with: @journal.website
    click_on "Create Journal"

    assert_text "Journal was successfully created"
    click_on "Back"
  end

  test "updating a Journal" do
    visit journals_url
    click_on "Edit", match: :first

    fill_in "Country", with: @journal.country_id
    fill_in "E issn", with: @journal.e_issn
    check "Is indexed" if @journal.is_indexed
    check "Is international" if @journal.is_international
    check "Is refereed" if @journal.is_refereed
    fill_in "Issn", with: @journal.issn
    fill_in "Name", with: @journal.name
    fill_in "Website", with: @journal.website
    click_on "Update Journal"

    assert_text "Journal was successfully updated"
    click_on "Back"
  end

  test "destroying a Journal" do
    visit journals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Journal was successfully destroyed"
  end
end
