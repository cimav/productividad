require "application_system_test_case"

class IndexersTest < ApplicationSystemTestCase
  setup do
    @indexer = indexers(:one)
  end

  test "visiting the index" do
    visit indexers_url
    assert_selector "h1", text: "Indexers"
  end

  test "creating a Indexer" do
    visit indexers_url
    click_on "New Indexer"

    fill_in "Name", with: @indexer.name
    fill_in "Website", with: @indexer.website
    click_on "Create Indexer"

    assert_text "Indexer was successfully created"
    click_on "Back"
  end

  test "updating a Indexer" do
    visit indexers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @indexer.name
    fill_in "Website", with: @indexer.website
    click_on "Update Indexer"

    assert_text "Indexer was successfully updated"
    click_on "Back"
  end

  test "destroying a Indexer" do
    visit indexers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Indexer was successfully destroyed"
  end
end
